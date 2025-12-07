# Drawing Application - C# Windows Forms
A comprehensive drawing application built with C# Windows Forms that executes drawing commands to create shapes and designs.

### View Documentation
- **[View Test Documentation](TestDocumentation.html)** - Click to see test documentation
- **[View API Documentation](Documentation.html)** - Click to see API documentation

## Features
- ✅ Draw circles and rectangles
- ✅ Draw lines between points
- ✅ Move cursor without drawing
- ✅ Change pen colors
- ✅ Save drawings as PNG images
- ✅ Load images onto canvas
- ✅ Execute single or multiple commands
- ✅ Keyboard shortcut (Shift+Enter)

## Design Patterns Used

### 1. Singleton Pattern
**Class**: `MyCanvas`
- Ensures only one canvas instance exists throughout the application
- Provides global access point to the canvas

### 2. Factory Pattern
**Class**: `CommandSlicing`
- Creates command objects based on command name
- Centralizes object creation logic
- Easy to extend with new commands

### 3. Command Pattern
**Classes**: `ShapeCircle`, `ShapeRectangle`, `MoveTo`, `DrawTo`, `MyPen`
- Encapsulates drawing operations as objects
- Uses BOOSE library base classes
- Supports Set(), Compile(), and Execute() methods

## Supported Commands

| Command | Syntax | Example | Description |
|---------|--------|---------|-------------|
| **moveto** | `moveto x,y` | `moveto 100,150` | Move cursor to position |
| **drawto** | `drawto x,y` | `drawto 200,200` | Draw line to position |
| **circle** | `circle radius [filled]` | `circle 50` | Draw circle at cursor |
| **rect** | `rect width,height [filled]` | `rect 100,50` | Draw rectangle at cursor |
| **pen** | `pen r,g,b` | `pen 255,0,0` | Set pen color (RGB 0-255) |

## Example Program
```
moveto 100,150
pen 0,0,255
circle 150
pen 255,0,0
moveto 150,50
rect 150,100
moveto 150,200
pen 0,0,255
circle 250
pen 255,0,0
moveto 200,250
rect 200,100
```

## Unit Tests
Comprehensive unit tests covering:
- ✅ MoveTo command position tracking
- ✅ DrawTo line drawing and position updates
- ✅ Circle and Rectangle drawing
- ✅ Pen color changes
- ✅ Multiline program execution
- ✅ Error handling and validation
- ✅ Factory pattern command creation
- ✅ Singleton pattern verification

**Total: 27 unit tests**

## Unit Tests Documentation
This project includes **27 comprehensive unit tests** covering all functionality.

### Test Coverage
| Category | Tests | Coverage |
|----------|-------|----------|
| **MoveTo Commands** | 4 | Position tracking and validation |
| **DrawTo Commands** | 3 | Line drawing and position updates |
| **Circle Commands** | 3 | Circle drawing (filled & outline) |
| **Rectangle Commands** | 3 | Rectangle drawing (filled & outline) |
| **Pen Commands** | 3 | Color setting and validation |
| **Multiline Programs** | 2 | Full program execution |
| **Compile Methods** | 5 | Parameter parsing and validation |
| **Factory Pattern** | 3 | Command creation |
| **Singleton Pattern** | 1 | Instance management |

### Test Results
```
✅ All 27 tests passing
✅ 100% test success rate
✅ Covers all commands
✅ Validates all design patterns
```

## Documentation
All code includes comprehensive XML documentation comments that are transformed into styled HTML pages using XSLT.

### Generating Documentation
To regenerate the HTML documentation from XML:
```bash
xsltproc -o Documentation.html documentation.xsl Documentation.xml
xsltproc -o TestDocumentation.html test-documentation.xsl TestDocumentation.xml
```

## Author
**Rudich Chhantel**

## License
This project is created for educational purposes as part of a programming assignment.

---
**Version**: 1.0  
**Last Updated**: December 2024
