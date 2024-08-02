print("map coloring")
def is_safe(graph, node, color, coloring):
    for neighbor in graph[node]:
        if neighbor in coloring and coloring[neighbor] == color:
            return False
    return True

def map_coloring(graph, colors, coloring, nodes):
    if not nodes:
        return True

    node = nodes[0]
    for color in colors:
        if is_safe(graph, node, color, coloring):
            coloring[node] = color
            if map_coloring(graph, colors, coloring, nodes[1:]):
                return True
            coloring.pop(node, None)

    return False

def main():
    graph = {
        'A': ['B', 'C','D'],
        'B': ['A', 'D'],
        'C': ['A', 'D'],
        'D': ['A','B','C']
    }


    colors = ['Red', 'Green', 'Blue', 'Yellow']


    coloring = {}


    nodes = list(graph.keys())

    if map_coloring(graph, colors, coloring, nodes):
        print("Map coloring solution:")
        for node, color in coloring.items():
            print(f"{node} -> {color}")
    else:
        print("No valid coloring found for the map.")

if __name__ == "__main__":
    main()