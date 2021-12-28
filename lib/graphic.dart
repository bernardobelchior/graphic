/// Graphic provides a Flutter charting library for data visualization. it has a
/// chart widget, calsses for specification, and some util classes and funtions
/// for customization.
///
/// To use this charting library, you only need to do one thing: to create a [Chart]
/// widget. This widget will evaluate and paint automatically in initial and on
/// update.
///
/// A start example of bar chart is as below:
///
/// ```dart
/// Chart(
///   data: [
///     { 'genre': 'Sports', 'sold': 275 },
///     { 'genre': 'Strategy', 'sold': 115 },
///     { 'genre': 'Action', 'sold': 120 },
///     { 'genre': 'Shooter', 'sold': 350 },
///     { 'genre': 'Other', 'sold': 150 },
///   ],
///   variables: {
///     'genre': Variable(
///       accessor: (Map map) => map['genre'] as String,
///     ),
///     'sold': Variable(
///       accessor: (Map map) => map['sold'] as num,
///     ),
///   },
///   elements: [IntervalElement()],
///   axes: [
///     Defaults.horizontalAxis,
///     Defaults.verticalAxis,
///   ],
/// )
/// ```
///
/// All specifications of data visualization are set by parameters of [Chart]'s
/// constructor as class properties.
///
/// The main processing flow of charting and some important concepts are as below.
/// Most concepts derive form the Grammar of Graphics. They will help to take full
/// advantage of this library. These are brif introcuction, and details see into
/// the Classes and [Chart] properties.
///
/// ```
///    variable    scale           aesthetic                  shape
///       |          |                 |                        |
/// data --> tuples --> scaled tuples --> aesthetic attributes --> figures
/// ```
///
/// ## Variable
///
/// Variables define the fields of [Tuple]s. The input data of the chart is a [List]
/// of any generic type. Yet they are not used directly inside the chart, instead,
/// the data are converted to [Tuple]s.
///
/// They are specified by [Chart.variables] or [Chart.transforms] with [Variable] or
/// [VariableTransform].
///
/// ## Algebra
///
/// The graphic algebra determins how variable values are assigned to position dimensions.
///
/// It is specified by [GeomElement.position] with [Varset]. See details of the algebra
/// rules in [Varset].
///
/// ## Scale
///
/// Scales convert [Tuple] values to to scaled values, which is easier to prosess
/// for aesthetic [Attr]s.
///
/// They are specified by [Variable.scale] with [Scale].
///
/// ## Coordinate
///
/// The coordinate determins how abstract positions are located on the canvas in
/// painting. The same element may look quite different in [RectCoord] and [PolarCoord].
///
/// It is specified by [Chart.coord] with [Coord].
///
/// ## Aesthetic
///
/// Aesthetic means to make [Tuple]s percivable. That is to give them aesthetic attributes
/// from the scaled values.
///
/// Aesthetic attributes are specified in [GeomElement] with [Attr]. And attributes
/// values are stored in [Aes].
///
/// ## Shape
///
/// Shapes render [Tuple]s with [Aes] attributes. Rendering means to get [Figure]s,
/// which carry the painting information for the rendering engine. Extending a shape
/// subclass is the way to custom charts.
///
/// Shape is also a aesthetic attribute is self. It is defined with [Shape], and
/// generated by [ShapeAttr] wich is defined by [GeomElement.shape]. The [Shape]
/// type should corresponds to [GeomElement] type.
///
/// ## Interaction
///
/// There are two kinds of interactions: [Signal] and [Selection]. Signal means
/// a certain specification value changes to [GestureSignal], [ResizeSignal], or
/// [ChangeDataSignal]. Selection means a tuple aesthetic attribute values change
/// when it is selected or not.
///
/// Signals are used by properties named in "on...Signal" with [SignalUpdater]. Selections
/// are specified by [Chart.selections] and used by [Attr.onSelection] with [SelectionUpdater].
///
/// ## Guide
///
/// Guides are various components that helps to read the chart.
///
/// They include [Axis] specified by [Chart.axes], [Tooltip] specified by [Chart.tooltip],
/// [Crosshair] specified by [Chart.crosshair], and [Annotation]s specified by [Chart.annotations],
library graphic;

export 'src/chart/chart.dart' show Chart;
export 'src/chart/size.dart' show ResizeSignal;

export 'src/data/data_set.dart' show ChangeDataSignal;

export 'src/variable/variable.dart' show Variable;
export 'src/variable/transform/transform.dart' show VariableTransform;
export 'src/variable/transform/filter.dart' show Filter;
export 'src/variable/transform/map.dart' show MapTrans;
export 'src/variable/transform/proportion.dart' show Proportion;
export 'src/variable/transform/sort.dart' show Sort;

export 'src/scale/scale.dart' show Scale;
export 'src/scale/discrete.dart' show DiscreteScale;
export 'src/scale/continuous.dart' show ContinuousScale;
export 'src/scale/linear.dart' show LinearScale;
export 'src/scale/ordinal.dart' show OrdinalScale;
export 'src/scale/time.dart' show TimeScale;

export 'src/geom/element.dart' show GeomElement;
export 'src/geom/function.dart' show FunctionElement;
export 'src/geom/partition.dart' show PartitionElement;
export 'src/geom/area.dart' show AreaElement;
export 'src/geom/custom.dart' show CustomElement;
export 'src/geom/interval.dart' show IntervalElement;
export 'src/geom/line.dart' show LineElement;
export 'src/geom/point.dart' show PointElement;
export 'src/geom/polygon.dart' show PolygonElement;
export 'src/geom/modifier/modifier.dart' show Modifier;
export 'src/geom/modifier/dodge.dart' show DodgeModifier;
export 'src/geom/modifier/stack.dart' show StackModifier;
export 'src/geom/modifier/jitter.dart' show JitterModifier;
export 'src/geom/modifier/symmetric.dart' show SymmetricModifier;

export 'src/aes/aes.dart' show Attr;
export 'src/aes/channel.dart' show ChannelAttr;
export 'src/aes/color.dart' show ColorAttr;
export 'src/aes/elevation.dart' show ElevationAttr;
export 'src/aes/gradient.dart' show GradientAttr;
export 'src/aes/label.dart' show LabelAttr;
export 'src/aes/shape.dart' show ShapeAttr;
export 'src/aes/size.dart' show SizeAttr;

export 'src/algebra/varset.dart' show Varset, AlgForm, AlgTerm;

export 'src/shape/shape.dart' show Shape;
export 'src/shape/function.dart' show FunctionShape;
export 'src/shape/partition.dart' show PartitionShape;
export 'src/shape/area.dart' show AreaShape, BasicAreaShape;
export 'src/shape/custom.dart' show CustomShape, CandlestickShape;
export 'src/shape/interval.dart' show IntervalShape, RectShape, FunnelShape;
export 'src/shape/line.dart' show LineShape, BasicLineShape;
export 'src/shape/point.dart' show PointShape, CircleShape, SquareShape;
export 'src/shape/polygon.dart' show PolygonShape, HeatmapShape;
export 'src/shape/util/render_basic_item.dart' show renderBasicItem;

export 'src/graffiti/figure.dart'
    show Figure, PathFigure, ShadowFigure, TextFigure, RotatedTextFigure;

export 'src/coord/coord.dart' show Coord, CoordConv;
export 'src/coord/polar.dart' show PolarCoord, PolarCoordConv;
export 'src/coord/rect.dart' show RectCoord, RectCoordConv;

export 'src/guide/axis/axis.dart'
    show TickLine, TickLineMapper, LabelMapper, GridMapper, AxisGuide;
export 'src/guide/interaction/tooltip.dart' show TooltipGuide, TooltipRenderer;
export 'src/guide/interaction/crosshair.dart' show CrosshairGuide;
export 'src/guide/annotation/annotation.dart' show Annotation;
export 'src/guide/annotation/figure.dart' show FigureAnnotation;
export 'src/guide/annotation/line.dart' show LineAnnotation;
export 'src/guide/annotation/region.dart' show RegionAnnotation;
export 'src/guide/annotation/mark.dart' show MarkAnnotation;
export 'src/guide/annotation/tag.dart' show TagAnnotation;
export 'src/guide/annotation/custom.dart' show CustomAnnotation;

export 'src/interaction/signal.dart' show Signal, SignalType, SignalUpdater;
export 'src/interaction/gesture.dart' show GestureType, Gesture, GestureSignal;
export 'src/interaction/selection/selection.dart'
    show Selection, SelectionUpdater;
export 'src/interaction/selection/interval.dart' show IntervalSelection;
export 'src/interaction/selection/point.dart' show PointSelection;

export 'src/common/styles.dart' show StrokeStyle;
export 'src/common/label.dart'
    show Label, LabelStyle, renderLabel, getPaintPoint;
export 'src/common/defaults.dart' show Defaults;
export 'src/common/dim.dart' show Dim;

export 'src/dataflow/tuple.dart' show Tuple, Aes;

export 'src/util/path.dart' show Paths;
export 'package:path_drawing/path_drawing.dart' show DashOffset;
