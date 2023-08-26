## GPX Proposal

### Refine Definitions

It has been suggested that some definitions be refined.

#### Elevation

> While we're at it, we should resolve the fuzzy definition of elevation,
> stating that it is "WGS84 Orthometric Height", which is well-specified
> by NIMA.  This corresponds to what GNSS receivers attempt to put in the
> elevation field of GGA etc.

More details in the original [message](https://groups.io/g/gpx/message/68).



#### Longitude / Latitude

> It would be fair to say that it's not ok to process GPX and
> round/truncate to less than 9, or that 9 have to be preserved.

More details in original [message](https://groups.io/g/gpx/message/71)



#### Tolerance

The GPX schema unambiguously describes how data should be represented in a GPX file. This is vital to ensure consistency from different software providers who provide a GPX export capability.

However, importing a GPX file need not be so strict as to reject files for reasons such as out-of-order elements, or even unrecognised elements. Ignoring unrecognised elements is the only way that a file import can stand a chance of being forward-compatible with future versions of the GPX standard.

Perhaps some guidance can be agreed for GPX imports and added to the GPX documentation?