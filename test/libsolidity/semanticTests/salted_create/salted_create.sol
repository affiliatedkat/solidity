contract B
{
}

contract A {
    function different_salt() public returns (bool) {
        B x = new B{salt: "abc"}();
        B y = new B{salt: "abcef"}();
        return x != y;
    }
    function same_salt() public returns (bool) {
        B x = new B{salt: "xyz"}();
        try new B{salt: "xyz"}() {} catch {
            return true;
        }
        return false;
    }
}
// ====
// EVMVersion: >=constantinople
// compileViaYul: also
// ----
// different_salt() -> true
// gas ir: 107186
// gas legacy: 125934
// gas legacyOptimized: 125869
// same_salt() -> true
// gas ir: 98439503
// gas legacy: 98439401
// gas legacyOptimized: 98439300
// gas irOptimized: 98439083
