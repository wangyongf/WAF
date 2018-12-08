/// base presenter
abstract class IPresenter<T> {
  init();
}

/// base view
abstract class IView<T> {
  setPresenter(T presenter);
}
