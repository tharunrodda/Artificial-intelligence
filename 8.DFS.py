print("DFS")
graph = {
    'A': ['B', 'C'],
    'B': ['D', 'E'],
    'C': ['F'],  # Added a comma here to correct the syntax
    'D': [],
    'E': ['F'],
    'F': []
}

def dfs(graph, start, visited):
    if start not in visited:
        print(start, end=' ')
        visited.add(start)
        for neighbor in graph[start]:
            dfs(graph, neighbor, visited)

def dfs_main(graph):
    visited = set()
    for node in graph:
        if node not in visited:
            dfs(graph, node, visited)

dfs_main(graph)
