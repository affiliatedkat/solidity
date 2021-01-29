contract C {
    uint[] storageArray;
    function test_indices(uint256 len) public
    {
        while (storageArray.length < len)
            storageArray.push();
        while (storageArray.length > len)
            storageArray.pop();
        for (uint i = 0; i < len; i++)
            storageArray[i] = i + 1;

        for (uint i = 0; i < len; i++)
            require(storageArray[i] == i + 1);
    }
}
// ====
// compileViaYul: also
// ----
// test_indices(uint256): 1 ->
// test_indices(uint256): 129 ->
// gas ir: 3797603
// gas legacy: 3340105
// gas legacyOptimized: 3280773
// gas irOptimized: 3572413
// test_indices(uint256): 5 ->
// gas ir: 781923
// gas legacy: 458941
// gas legacyOptimized: 455849
// gas irOptimized: 684693
// test_indices(uint256): 10 ->
// gas ir: 107663
// test_indices(uint256): 15 ->
// gas ir: 139793
// gas irOptimized: 115342
// test_indices(uint256): 0xFF ->
// gas ir: 4994703
// gas legacy: 4107867
// gas legacyOptimized: 3991807
// gas irOptimized: 4554277
// test_indices(uint256): 1000 ->
// gas ir: 23586895
// gas legacy: 20360399
// gas legacyOptimized: 19921344
// gas irOptimized: 21917394
// test_indices(uint256): 129 ->
// gas ir: 5948697
// gas legacy: 3472135
// gas legacyOptimized: 3415947
// gas irOptimized: 5135327
// test_indices(uint256): 128 ->
// gas ir: 852771
// gas legacy: 556972
// gas legacyOptimized: 508124
// gas irOptimized: 663783
// test_indices(uint256): 1 ->
// gas ir: 773769
// gas legacy: 452407
// gas legacyOptimized: 450811
// gas irOptimized: 680239
