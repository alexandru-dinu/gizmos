from IPython.core.magic import register_line_magic


def __safe_import(*, _from: str | None, _import: str, _as: str | None) -> None:
    """
    [from `_from`] import `_import` [as `_as`]
    Adapted from https://stackoverflow.com/a/64791087
    """
    i = f"import {_import}"
    if _as:
        i = f"{i} as {_as}"
    if _from:
        i = f"from {_from} {i}"

    if not _as:
        _as = _import

    try:
        if not _from:
            globals()[_as] = __import__(_import)
        else:
            globals()[_as] = getattr(__import__(_from, fromlist=[_import]), _import)
        print(f"... {i}")
    except ImportError as e:
        print(f"!!! {e}")


@register_line_magic
def ic(line):
    """
    (i)mport (c)ommon
    """
    # internal
    __safe_import(_from=None, _import="os", _as=None)
    __safe_import(_from=None, _import="time", _as=None)
    __safe_import(_from="pathlib", _import="Path", _as=None)

    # external
    __safe_import(_from=None, _import="numpy", _as="np")
    __safe_import(_from=None, _import="pandas", _as="pd")
    __safe_import(_from="tqdm.auto", _import="tqdm", _as=None)
    __safe_import(_from="tqdm.auto", _import="trange", _as=None)
    __safe_import(_from="matplotlib", _import="pyplot", _as="plt")
    __safe_import(_from=None, _import="seaborn", _as="sns")
