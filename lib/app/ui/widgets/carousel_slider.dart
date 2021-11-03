import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatefulWidget {
  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  CarouselSlider(
      {@required this.items,
      this.height,
      this.aspectRatio: 16 / 9,
      this.viewportFraction: 0.8,
      this.initialPage: 0,
      int realPage: 10000,
      this.enableInfiniteScroll: true,
      this.reverse: false,
      this.autoPlay: false,
      this.autoPlayInterval: const Duration(seconds: 4),
      this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
      this.autoPlayCurve: Curves.fastOutSlowIn,
      this.pauseAutoPlayOnTouch,
      this.enlargeCenterPage = false,
      this.onPageChanged,
      this.scrollPhysics,
      this.scrollDirection: Axis.horizontal})
      : this.realPage = enableInfiniteScroll ?? false
            ? realPage + (initialPage ?? 0)
            : initialPage,
        this.pageController = PageController(
            viewportFraction: viewportFraction ?? 0.0,
            initialPage: enableInfiniteScroll ?? false
                ? realPage + (initialPage ?? 0)
                : initialPage ?? 0);

  /// The widgets to be shown in the carousel.
  final List<Widget>? items;

  /// Set carousel height and overrides any existing [aspectRatio].
  final double? height;

  /// Aspect ratio is used if no height have been declared.
  ///
  /// Defaults to 16:9 aspect ratio.
  final double? aspectRatio;

  /// The fraction of the viewport that each page should occupy.
  ///
  /// Defaults to 0.8, which means each page fills 80% of the carousel.
  final double? viewportFraction;

  /// The initial page to show when first creating the [CarouselSlider].
  ///
  /// Defaults to 0.
  final int? initialPage;

  /// The actual index of the [PageView].
  ///
  /// This value can be ignored unless you know the carousel will be scrolled
  /// backwards more then 10000 pages.
  /// Defaults to 10000 to simulate infinite backwards scrolling.
  final num? realPage;

  ///Determines if carousel should loop infinitely or be limited to item length.
  ///
  ///Defaults to true, i.e. infinite loop.
  final bool? enableInfiniteScroll;

  /// Reverse the order of items if set to true.
  ///
  /// Defaults to false.
  final bool? reverse;

  /// Enables auto play, sliding one page at a time.
  ///
  /// Use [autoPlayInterval] to determent the frequency of slides.
  /// Defaults to false.
  final bool? autoPlay;

  /// Sets Duration to determent the frequency of slides when
  ///
  /// [autoPlay] is set to true.
  /// Defaults to 4 seconds.
  final Duration? autoPlayInterval;

  /// The animation duration between two transitioning pages while in auto playback.
  ///
  /// Defaults to 800 ms.
  final Duration? autoPlayAnimationDuration;

  /// Determines the animation curve physics.
  ///
  /// Defaults to [Curves.fastOutSlowIn].
  final Curve? autoPlayCurve;

  /// Sets a timer on touch detected that pause the auto play with
  /// the given [Duration].
  ///
  /// Touch Detection is only active if [autoPlay] is true.
  final Duration? pauseAutoPlayOnTouch;

  /// Determines if current page should be larger then the side images,
  /// creating a feeling of depth in the carousel.
  ///
  /// Defaults to false.
  final bool? enlargeCenterPage;

  /// The axis along which the page view scrolls.
  ///
  /// Defaults to [Axis.horizontal].
  final Axis scrollDirection;

  /// Called whenever the page in the center of the viewport changes.
  final Function(int index)? onPageChanged;

  /// How the carousel should respond to user input.
  ///
  /// For example, determines how the items continues to animate after the
  /// user stops dragging the page view.
  ///
  /// The physics are modified to snap to page boundaries using
  /// [PageScrollPhysics] prior to being used.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics? scrollPhysics;

  /// [pageController] is created using the properties passed to the constructor
  /// and can be used to control the [PageView] it is passed to.
  late final PageController pageController;

  /// Animates the controlled [CarouselSlider] to the next page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  Future<void> nextPage({required Duration duration, required Curve curve}) {
    return pageController.nextPage(duration: duration, curve: curve);
  }

  /// Animates the controlled [CarouselSlider] to the previous page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  Future<void> previousPage(
      {required Duration duration, required Curve curve}) {
    return pageController.previousPage(duration: duration, curve: curve);
  }

  /// Changes which page is displayed in the controlled [CarouselSlider].
  ///
  /// Jumps the page position from its current value to the given value,
  /// without animation, and without checking if the new value is in range.
  void jumpToPage(int page) {
    final index = _getRealIndex(pageController.page?.toInt() ?? 0,
        realPage?.toInt() ?? 0, items?.length ?? 0);
    return pageController
        .jumpToPage(pageController.page?.toInt() ?? 0 + page - index);
  }

  /// Animates the controlled [CarouselSlider] from the current page to the given page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  Future<void> animateToPage(int page,
      {required Duration duration, required Curve curve}) {
    final index = _getRealIndex(pageController.page?.toInt() ?? 0,
        realPage?.toInt() ?? 0, items?.length ?? 0);
    return pageController.animateToPage(
        pageController.page?.toInt() ?? 0 + page - index,
        duration: duration,
        curve: curve);
  }

  @override
  _CarouselSliderState createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider>
    with TickerProviderStateMixin {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = getTimer();
  }

  Timer getTimer() {
    return Timer.periodic(widget.autoPlayInterval ?? Duration(), (_) {
      if (widget.autoPlay ?? false) {
        final autoPlayAnimationDuration = widget.autoPlayAnimationDuration;
        final autoPlayCurve = widget.autoPlayCurve;

        if (autoPlayAnimationDuration != null && autoPlayCurve != null) {
          widget.pageController.nextPage(
              duration: autoPlayAnimationDuration, curve: autoPlayCurve);
        }
      }
    });
  }

  void pauseOnTouch() {
    timer?.cancel();
    timer = Timer(widget.pauseAutoPlayOnTouch ?? Duration(), () {
      timer = getTimer();
    });
  }

  Widget getWrapper(Widget child) {
    if (widget.height != null) {
      final Widget wrapper = Container(height: widget.height, child: child);
      return widget.autoPlay ?? false ? addGestureDetection(wrapper) : wrapper;
    } else {
      final Widget wrapper =
          AspectRatio(aspectRatio: widget.aspectRatio ?? 0.0, child: child);
      return widget.autoPlay ?? false ? addGestureDetection(wrapper) : wrapper;
    }
  }

  Widget addGestureDetection(Widget child) =>
      GestureDetector(onPanDown: (_) => pauseOnTouch(), child: child);

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return getWrapper(PageView.builder(
      physics: widget.scrollPhysics,
      scrollDirection: widget.scrollDirection,
      controller: widget.pageController,
      // pageSnapping: false,
      reverse: widget.reverse ?? false,
      itemCount:
          widget.enableInfiniteScroll ?? false ? null : widget.items?.length,
      onPageChanged: (int index) {
        int currentPage = _getRealIndex(index + (widget.initialPage ?? 0),
            widget.realPage?.toInt() ?? 0, widget.items?.length ?? 0);

        widget.onPageChanged?.call(currentPage);
      },
      itemBuilder: (BuildContext context, int i) {
        final int index = _getRealIndex(i + (widget.initialPage ?? 0),
            widget.realPage?.toInt() ?? 0, widget.items?.length ?? 0);

        return AnimatedBuilder(
          animation: widget.pageController,
          child: widget.items?[index],
          builder: (BuildContext context, child) {
            double value = (widget.pageController.page ?? 0) - i;
            value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);

            final double distortionValue = widget.enlargeCenterPage ?? false
                ? Curves.easeOut.transform(value)
                : 1.0;

            if (widget.scrollDirection == Axis.horizontal) {
              return Container(child: child);
              // return Container(
              //     alignment: Alignment.topLeft,
              //     child: Container(child: child, alignment: Alignment.topLeft));
            } else {
              return Center(
                  child: SizedBox(
                      width:
                          distortionValue * MediaQuery.of(context).size.width,
                      child: child));
            }
          },
        );
      },
    ));
  }
}

/// Converts an index of a set size to the corresponding index of a collection of another size
/// as if they were circular.
///
/// Takes a [position] from collection Foo, a [base] from where Foo's index originated
/// and the [length] of a second collection Baa, for which the correlating index is sought.
///
/// For example; We have a Carousel of 10000(simulating infinity) but only 6 images.
/// We need to repeat the images to give the illusion of a never ending stream.
/// By calling _getRealIndex with position and base we get an offset.
/// This offset modulo our length, 6, will return a number between 0 and 5, which represent the image
/// to be placed in the given position.
int _getRealIndex(int position, int base, int length) {
  final int offset = position - base;
  return _remainder(offset, length);
}

/// Returns the remainder of the modulo operation [input] % [source], and adjust it for
/// negative values.
int _remainder(int input, int source) {
  final int result = input % source;
  return result < 0 ? source + result : result;
}
