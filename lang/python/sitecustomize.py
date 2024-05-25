import sys

def _onlyzippaths():
    L = []
    known_paths = set()
    for dir0 in sys.path:
        if dir0 not in known_paths and dir0.startswith("/zip/"):
            L.append(dir0)
            known_paths.add(dir0)
    sys.path[:] = L
    return known_paths

_onlyzippaths()
