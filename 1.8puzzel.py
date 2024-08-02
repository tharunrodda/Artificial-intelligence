import heapq


class PuzzleNode:
    def __init__(self, state, parent=None, move=None):
        self.state = state
        self.parent = parent
        self.move = move
        self.cost = 0 if parent is None else parent.cost + 1

    def __lt__(self, other):
        return (self.cost + self.heuristic()) < (other.cost + other.heuristic())

    def __eq__(self, other):
        return self.state == other.state

    def __hash__(self):
        return hash(str(self.state))

    def is_goal(self):
        return self.state == goal_state

    def find_blank(self):
        for i, row in enumerate(self.state):
            for j, value in enumerate(row):
                if value == 0:
                    return i, j

    def generate_children(self):
        i, j = self.find_blank()
        children = []

        for move in moves:
            new_i, new_j = i + move[0], j + move[1]

            if 0 <= new_i < 3 and 0 <= new_j < 3:
                new_state = [list(row) for row in self.state]
                new_state[i][j], new_state[new_i][new_j] = new_state[new_i][new_j], new_state[i][j]
                children.append(PuzzleNode(new_state, self, move))

        return children

    def heuristic(self):
        # Manhattan distance heuristic
        total_distance = 0

        for i in range(3):
            for j in range(3):
                value = self.state[i][j]
                if value != 0:
                    goal_i, goal_j = goal_positions[value]
                    total_distance += abs(i - goal_i) + abs(j - goal_j)

        return total_distance

    def total_cost(self):
        # Calculate the total cost from the initial state to this node
        cost = self.cost
        node = self.parent
        while node:
            cost += node.cost
            node = node.parent
        return cost


def solve_puzzle(initial_state):
    initial_node = PuzzleNode(initial_state)
    heap = [initial_node]
    visited = set()

    while heap:
        current_node = heapq.heappop(heap)

        if current_node.is_goal():
            return get_solution(current_node)

        visited.add(current_node)

        children = current_node.generate_children()

        for child in children:
            if child not in visited and child not in heap:
                heapq.heappush(heap, child)

    return None


def get_solution(node):
    solution = []
    total_cost = node.total_cost()  # Get total cost from the initial state to this node

    while node:
        solution.append((node.move, node.state))
        node = node.parent

    solution.reverse()
    return solution, total_cost


if __name__ == "__main__":
    initial_state = [
        [1, 2, 3],
        [4, 0, 5],
        [6, 7, 8]
    ]

    goal_state = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 0]
    ]

    goal_positions = {1: (0, 0), 2: (0, 1), 3: (0, 2),
                      4: (1, 0), 5: (1, 1), 6: (1, 2),
                      7: (2, 0), 8: (2, 1)}

    moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]

    solution, total_cost = solve_puzzle(initial_state)

    if solution:
        print(f"Total cost of the solution: {total_cost}")
        for step, state in solution:
            print(f"Move {step}:")
            for row in state:
                print(row)
            print()
    else:
        print("No solution found.")
