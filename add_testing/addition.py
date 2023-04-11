#!/usr/bin/env python
#
def addition(a, b):
    """
    This function adds the two values.

    Args:
        a: an integer no
        b: an integer no
    
    Returns:
        added value
    """
    if not isinstance(a, int) and not isinstance(b, int):
        raise TypeError(f"Variables a and b should be of type 'int' but found a: {type(a)}, b: {type(b)}.")
    return a + b
