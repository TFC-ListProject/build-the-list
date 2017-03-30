import conftest
import build_the_list.main as main

def test_main():
    assert main.inc(1) == 2
