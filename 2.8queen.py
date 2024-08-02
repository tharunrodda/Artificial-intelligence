def is_safe(board, row, col):
    # Check if there's a queen in the same column
    for i in range(row):
        if board[i] == col:
            return False

    # Check upper diagonal on left side
    for i, j in zip(range(row, -1, -1), range(col, -1, -1)):
        if board[i] == j:
            return False

    # Check upper diagonal on right side
    for i, j in zip(range(row, -1, -1), range(col, 8)):
        if board[i] == j:
            return False

    return True


def solve_queens(board, row):
    if row >= 8:
        return True

    for col in range(8):
        if is_safe(board, row, col):
            board[row] = col
            if solve_queens(board, row + 1):
                return True
            board[row] = -1

    return False


def print_solution(board):
    for i in range(8):
        line = ""
        for j in range(8):
            if board[i] == j:
                line += "Q "
            else:
                line += ". "
        print(line)
    print()


def solve_8_queens():
    board = [-1] * 8
    if solve_queens(board, 0):
        print_solution(board)
    else:
        print("No solution exists.")


solve_8_queens()
