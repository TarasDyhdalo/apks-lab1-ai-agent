from hello.main import add


class TestBasicAddition:
    def test_adds_two_integers(self) -> None:
        assert add(2, 3) == 5
