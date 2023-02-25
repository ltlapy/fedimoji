export *

dev = true
log = => if dev then print @ else nil
bool = => @ and true or false