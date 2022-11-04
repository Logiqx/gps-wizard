## GPS Exchange Format (GPX) - Motion

### GPX 1.0

The GPX files created by the Motion GPS are fine as of firmware 3084. They use GPX 1.0 and include the correct header:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx creator="Motion-GPS"
     version="1.0"
     xmlns="http://www.topografix.com/GPX/1/0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd">
```

