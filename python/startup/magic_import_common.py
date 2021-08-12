from IPython.core.magic import register_line_magic


# From https://stackoverflow.com/a/64791087
def _global_import(
    object_name: str, short_name: str = None, context_module_name: str = None
):
    """import from local function as global import

    Args:
        object_name: the object name want to import,
                     could be module or function
        short_name: the short name for the import
        context_module_name: the context module name in the import

    Examples:
        import os -> _global_import("os")

        import numpy as np -> _global_import("numpy", "np")

        from collections import Counter ->
            _global_import("Counter", None, "collections")

        from google.cloud import storage ->
            _global_import("storage", None, "google.cloud")
    """
    if not short_name:
        short_name = object_name
    if not context_module_name:
        globals()[short_name] = __import__(object_name)
    else:
        context_module = __import__(context_module_name, fromlist=[object_name])
        globals()[short_name] = getattr(context_module, object_name)


@register_line_magic
def magic_import_common(line):
    _global_import("numpy", "np")
