from IPython.core.magic import register_line_magic


# From https://stackoverflow.com/a/64791087
def _global_import(obj: str, syn: str = None, ctx: str = None):
    """[from `ctx`] import `obj` [as `syn`]"""
    explain = [f"import {obj}"]
    if syn:
        explain.append(f"as {syn}")
    if ctx:
        explain.insert(0, f"from {ctx}")
    print(" ".join(explain))

    if not syn:
        syn = obj
    if not ctx:
        globals()[syn] = __import__(obj)
    else:
        globals()[syn] = getattr(__import__(ctx, fromlist=[obj]), obj)


@register_line_magic
def magic_import_common(line):
    _global_import("Path", None, "pathlib")
    _global_import("numpy", "np")
    _global_import("torch", "T")
    _global_import("torch.nn", "nn")
    _global_import("pandas", "pd")
    _global_import("matplotlib.pyplot", "plt")
    _global_import("seaborn", "sns")
