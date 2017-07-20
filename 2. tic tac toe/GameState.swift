enum Move {
    case playerX
    case playerO

    var symbol: String {
        switch self {
            case .playerO:
                return "O"
            case .playerX:
                return "X"
        }
    }
}

struct GameState {
    var state: [[Move?]]

    init(count: Int) {
        state = Array(repeating: Array(repeating: nil, count: count), count: count)
    }

    mutating func addMove(row: Int, column: Int, move: Move) -> Bool {
        guard state[row][column] == nil else {
            return false
        }
        state[row][column] = move
        return true
    }

    func hasWinner() -> Move? {
        let transposedState = transpose(input: state)

        if state.contains(where: { $0.every { $0 == .playerX } })
            || transposedState.contains(where: { $0.every { $0 == .playerX }}) {
            return .playerX
        }

        if state.contains(where: { $0.every { $0 == .playerO } })
            || transposedState.contains(where: { $0.every { $0 == .playerO } }) {
            return .playerO
        }

        // XXX: Check diaglonal winner
        // pirmais masīva lodziņš + 1 katrai nākamajai rindai / pēdējais masīva lodziņs - 1 katrai nākamajai rindai

        // Return nil if we have no winner
        return nil
    }
}

//        [1][2][3]-
//        [4][5][6]-
//        [7][8][9]-
//         |  |  |

public func transpose<T>(input: [[T]]) -> [[T]] {
    if input.isEmpty { return [[T]]() }
    let count = input[0].count

    var out = Array(repeating: [T](), count: count)
    for outer in input {
        for (index, inner) in outer.enumerated() {
            out[index].append(inner)
        }
    }

    return out
}

extension Sequence {
    /// Returns `true` if *every* element in `self` satisfies `predicate`.
    public func every(
        predicate: (Self.Iterator.Element) throws -> Bool
        ) rethrows -> Bool {
        for element in self {
            if try !predicate(element) {
                return false
            }
        }
        return true
    }
}
