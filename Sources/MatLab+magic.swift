//
//  MatLab+magic.swift
//  
//
//  Created by Damien Noël Dubuisson on 26/10/2021.
//

public extension MatLab {
    ///
    /// magic(n) function from [mathworks.com](https://www.mathworks.com/help/matlab/ref/magic.html)
    ///
    /// - Parameters:
    ///     - n: Size of square matrix.
    ///
    /// - Returns:
    ///     Returns an n-by-n matrix constructed from the integers 1 through n2 with equal row and column sums.
    ///
    static func magic<T: Numeric>(_ n: Int) -> Matrix<T> {
        precondition(n > 2) // The order n must be a scalar greater than or equal to 3 in order to create a valid magic square.
        guard n%2 == 0 else { return oddMagic(n) } // guard isEven else return oddMagic
        guard n%4 == 0 else { return singlyEvenMagic(n) } // guard isDoublyEven else return singlyEvenMagic
        return doublyEvenMagic(n) // return doublyEvenMagic

//        var matrix: Matrix<T> = zeros(n)
//        // Set the indices for the middle of the bottom i
//        var i = 0, j = n / 2
//        matrix[i, j] = T.one
//        // Fill each element of the array using the magic array
//        for value in (2...(n*n)) {
//            // Find the next cell, wrapping around if necessary
//            let newRow = (i + 1) % n
//            let newCol = (j + 1) % n
//            // If the cell is empty, remember those indices for the next assignment
//            if matrix[newRow, newCol] == .zero {
//                i = newRow
//                j = newCol
//            } else {
//                // The cell was full. Use the cell above the previous one
//                i = (i - 1 + n) % n
//            }
//            matrix[i, j] = T(value)
//        }
//        return matrix
    }

    private static func oddMagic<T: Numeric>(_ n: Int) -> Matrix<T> {
        var matrix: Matrix<T> = zeros(n)
        var i = 0, j = n / 2 // start position
        for value in (1...(n*n)) {
            matrix[i, j] = T(value)
            i -= 1
            j += 1
            if value%n == 0 {
                i += 2
                j -= 1
            } else {
                if j == n {
                    j -= n
                } else if i < 0 {
                    i += n
                }
            }
        }
        return matrix
    }

    private static func singlyEvenMagic<T: Numeric>(_ n: Int) -> Matrix<T> {
        var matrix: Matrix<T> = zeros(n)
        let p = n/2
        let magicP: Matrix<T> = magic(p)
        var arrI = [Int](), arrJ = [Int]()

        for i in 0..<p {
            for j in 0..<p {
                matrix[i, j] = magicP[i, j]
                matrix[i+p, j] = magicP[i, j] + T(3*p*p)
                matrix[i, j+p] = magicP[i, j] + T(2*p*p)
                matrix[i+p, j+p] = magicP[i, j] + T(p*p)
            }
            arrI.append(i+1)
        }

        let k = (n-2)/4
        for i in 1...k {
            arrJ.append(i)
        }
        if n-k+2 <= n {
            for i in n-k+2...n {
                arrJ.append(i)
            }
        }

        var temp: T = .zero
        for i in 1...p {
            for j in 1...arrJ.count {
                temp = matrix[i-1, arrJ[j-1]-1];
                matrix[i-1, arrJ[j-1]-1] = matrix[i+p-1, arrJ[j-1]-1];
                matrix[i+p-1, arrJ[j-1]-1] = temp;
            }
        }

        temp = matrix[k, 0]
        matrix[k, 0] = matrix[k+p, 0]
        matrix[k+p, 0] = temp

        temp = matrix[k+p, k]
        matrix[k+p, k] = matrix[k, k]
        matrix[k, k] = temp

        return matrix
    }

    private static func doublyEvenMagic<T: Numeric>(_ n: Int) -> Matrix<T> {
        var matrix: Matrix<T> = zeros(n)
        var matI: Matrix<T> = zeros(n), matJ: Matrix<T> = zeros(n)
        var index = T.one

        for i in 0..<n {
            for j in 0..<n {
                matI[i, j] = ((i+1)%4)/2
                matJ[j, i] = ((i+1)%4)/2
                matrix[i, j] = index
                index += .one
            }
        }
        for i in 0..<n {
            for j in 0..<n {
                if matI[i, j] == matJ[i, j] {
                    matrix[i, j] = T(n*n + 1) - matrix[i, j]
                }
            }
        }

        return matrix
    }
}
