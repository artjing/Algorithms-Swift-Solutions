import UIKit


/*
 
 // MARK - Question

 Given an n x n grid containing only values 0 and 1, where 0 represents water and 1 represents land, find a water cell such that its distance to the nearest land cell is maximized, and return the distance. If no land or water exists in the grid, return -1.
 
 The distance used in this problem is the Manhattan distance: the distance between two cells (x0, y0) and (x1, y1) is |x0 - x1| + |y0 - y1|.
 
 Example 1:
 
 Input: grid = [[1,0,1],[0,0,0],[1,0,1]]
 Output: 2
 Explanation: The cell (1, 1) is as far as possible from all the land with distance 2.
 Example 2:
 
 
 Input: grid = [[1,0,0],[0,0,0],[0,0,0]]
 Output: 4
 Explanation: The cell (2, 2) is as far as possible from all the land with distance 4.
 
 
 // MARK - Solution
 Multi-source BFS
 Multi-source BFS is used to solve this problem with multiple starting points. The process is to do a diffusion to
 the surrounding water.The realization idea of ​​multi-source BFS: In each round of traversal, one more step is taken to update the nodes from the updated node in the previous round, until all nodes have been updated once.
 
 // MARK - Time/Space complex
 The time complexity is O(n*n*turn), which is only related to the longest distance sought, and has nothing to do with the number of lands.
 1, Traverse all of the nodes in the matrix and get all of the land nodes, then push to the queue
 2, Interate all of the nodes inside the queue and update new nodes in four directions, until finding the longest distance.
 Expression:
 This method is slower in the case of more land.
 */


struct Location{
    var x: Int
    var y: Int
}


let result = maxDistance([[1,0,0,0,0],[1,0,0,0,0],[1,0,0,0,0]])
print(result)
func maxDistance(_ grid: [[Int]]) -> Int {
    
    var grid = grid
    guard grid.count > 0 else { return 0 }
    let m = grid.count
    let n = grid[0].count
    var queue = [Location]()
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    for i in 0..<m{
        for j in 0..<n{
            if grid[i][j] == 1{
                queue.append(Location(x:i,y:j))
            }
        }
    }
    
    if queue.count == grid.count * grid[0].count || queue.count == 0 {return -1}
    
    var result = -1
    while !queue.isEmpty {
        result += 1
        let n = queue.count
        for _ in 0..<n {
            let loc = queue.removeFirst()
            let x = loc.x
            let y = loc.y
            for i in 0..<4 {
                let x = x + dx[i]
                let y = y + dy[i]
                if x >= 0 && x < grid.count && y >= 0 && y < grid[0].count && grid[x][y] == 0 {
                    queue.append(Location(x:x, y:y))
                    grid[x][y] = 2
                }
            }
        }
    }
    return result
}
