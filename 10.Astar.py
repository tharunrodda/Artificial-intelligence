import heapq


class Node:
    def __init__(self, position, parent=None, cost=0):
        self.position = position
        self.parent = parent
        self.g = cost  # Cost from start to this node
        self.h = 0  # Heuristic cost from this node to goal
        self.f = cost  # Total cost

    def __eq__(self, other):
        return self.position == other.position

    def __lt__(self, other):
        return self.f < other.f


def astar_tree(start, goal, tree, heuristic):
    open_list = []
    closed_list = set()

    start_node = Node(start, cost=0)
    goal_node = Node(goal)

    heapq.heappush(open_list, start_node)

    while open_list:
        current_node = heapq.heappop(open_list)
        closed_list.add(current_node.position)

        if current_node.position == goal_node.position:
            path = []
            while current_node:
                path.append(current_node.position)
                current_node = current_node.parent
            return path[::-1]

        for child, cost in tree.get(current_node.position, []):
            if child in closed_list:
                continue

            neighbor_node = Node(child, parent=current_node, cost=current_node.g + cost)
            neighbor_node.h = heuristic(child, goal_node.position)
            neighbor_node.f = neighbor_node.g + neighbor_node.h

            if any(node.position == child and node.f <= neighbor_node.f for node in open_list):
                continue

            heapq.heappush(open_list, neighbor_node)

    return []


# Example usage

# Define the tree as a dictionary of nodes, where each node maps to a list of (child, cost) tuples
tree = {
    'A': [('B', 1), ('C', 4)],
    'B': [('D', 1), ('E', 3)],
    'C': [('F', 1)],
    'D': [],
    'E': [('G', 1)],
    'F': [('G', 5)],
    'G': []
}


# Define a simple heuristic function (Euclidean distance or similar)
def heuristic(node, goal):
    heuristics = {
        'A': 7,
        'B': 6,
        'C': 5,
        'D': 4,
        'E': 3,
        'F': 2,
        'G': 0
    }
    return heuristics.get(node, float('inf'))


# Define start and goal
start = 'A'
goal = 'G'

path = astar_tree(start, goal, tree, heuristic)
print("Path found:", path)