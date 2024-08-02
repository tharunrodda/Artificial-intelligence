from collections import deque

class State:
    def __init__(self, jug1, jug2):
        self.jug1 = jug1
        self.jug2 = jug2

    def __eq__(self, other):
        return self.jug1 == other.jug1 and self.jug2 == other.jug2

    def __hash__(self):
        return hash((self.jug1, self.jug2))

    def __str__(self):
        return f"({self.jug1}, {self.jug2})"

def water_jug_problem(capacity_jug1, capacity_jug2, target):
    initial_state = State(0, 0)
    visited = set()
    queue = deque([initial_state])

    while queue:
        current_state = queue.popleft()

        if current_state.jug1 == target or current_state.jug2 == target:
            print("Solution found:", current_state)
            return

        visited.add(current_state)

        # Fill jug1
        fill_jug1 = State(capacity_jug1, current_state.jug2)
        if fill_jug1 not in visited and fill_jug1 not in queue:
            queue.append(fill_jug1)

        # Fill jug2
        fill_jug2 = State(current_state.jug1, capacity_jug2)
        if fill_jug2 not in visited and fill_jug2 not in queue:
            queue.append(fill_jug2)

        # Empty jug1
        empty_jug1 = State(0, current_state.jug2)
        if empty_jug1 not in visited and empty_jug1 not in queue:
            queue.append(empty_jug1)

        # Empty jug2
        empty_jug2 = State(current_state.jug1, 0)
        if empty_jug2 not in visited and empty_jug2 not in queue:
            queue.append(empty_jug2)

        # Pour from jug1 to jug2
        pour_jug1_to_jug2 = State(
            max(0, current_state.jug1 - (capacity_jug2 - current_state.jug2)),
            min(capacity_jug2, current_state.jug2 + current_state.jug1)
        )
        if pour_jug1_to_jug2 not in visited and pour_jug1_to_jug2 not in queue:
            queue.append(pour_jug1_to_jug2)

        # Pour from jug2 to jug1
        pour_jug2_to_jug1 = State(
            min(capacity_jug1, current_state.jug1 + current_state.jug2),
            max(0, current_state.jug2 - (capacity_jug1 - current_state.jug1))
        )
        if pour_jug2_to_jug1 not in visited and pour_jug2_to_jug1 not in queue:
            queue.append(pour_jug2_to_jug1)

if __name__ == "__main__":
    capacity_jug1 = 4
    capacity_jug2 = 3
    target = 2

    water_jug_problem(capacity_jug1, capacity_jug2, target)