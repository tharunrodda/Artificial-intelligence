n = 4 # there are four nodes in example graph (graph is 1-based)

# dist[i][j] represents shortest distance to go from i to j
# this matrix can be calculated for any given graph using
# all-pair shortest path algorithms
dist = [
    [0, 0, 0, 0, 0],
    [0, 0, 10, 15, 20],
    [0, 10, 0, 25, 25],
    [0, 15, 25, 0, 30],
    [0, 20, 25, 30, 0]
]

# memoization for top down recursion
memo = [[-1]*(1 << (n+1)) for _ in range(n+1)]
path = [[-1]*(1 << (n+1)) for _ in range(n+1)]  # To store the path

def fun(i, mask):
    # base case
    # if only ith bit and 1st bit is set in our mask,
    # it implies we have visited all other nodes already
    if mask == ((1 << i) | 3):
        return dist[1][i]

    # memoization
    if memo[i][mask] != -1:
        return memo[i][mask]

    res = 10**9  # result of this sub-problem
    best_j = -1  # to track the best node to go to

    # we have to travel all nodes j in mask and end the path at ith node
    # so for every node j in mask, recursively calculate cost of
    # travelling all nodes in mask
    # except i and then travel back from node j to node i taking
    # the shortest path take the minimum of all possible j nodes
    for j in range(1, n+1):
        if (mask & (1 << j)) != 0 and j != i and j != 1:
            current_res = fun(j, mask & (~(1 << i))) + dist[j][i]
            if current_res < res:
                res = current_res
                best_j = j  # update the best node

    memo[i][mask] = res  # storing the minimum value
    path[i][mask] = best_j  # store the path
    return res

# To reconstruct the path
def get_path(start):
    mask = (1 << (n+1)) - 1
    cur = start
    result_path = [1]

    while cur != -1:
        result_path.append(cur)
        cur = path[cur][mask]
        mask = mask & (~(1 << result_path[-1]))

    result_path.append(1)  # add the starting node at the end to complete the cycle
    return result_path

# Driver program to test above logic
ans = 10**9
start_node = -1

for i in range(1, n+1):
    # try to go from node 1 visiting all nodes in between to i
    # then return from i taking the shortest route to 1
    current_ans = fun(i, (1 << (n+1))-1) + dist[i][1]
    if current_ans < ans:
        ans = current_ans
        start_node = i

print("The cost of most efficient tour = " + str(ans))
print("The most efficient path = " + ' -> '.join(map(str, get_path(start_node))))

# This code is contributed by Serjeel Ranjan, modified to add path tracking
