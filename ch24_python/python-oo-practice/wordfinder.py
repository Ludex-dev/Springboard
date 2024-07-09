"""Word Finder: finds random words from a dictionary."""


class WordFinder:
    ...

    def __init__(self, path):
        """Read dictionary and reports # items read."""

        # self.words = self.read_file(path)

        with open(path, 'r') as file:
            self.words = file.read().split()

        print(f"{len(self.words)} words read")

    def random(self):
        """Return a random word."""
        # self.words)

wf = WordFinder("ch24_python\python-oo-practice\words.txt")