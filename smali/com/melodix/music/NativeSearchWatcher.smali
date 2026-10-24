.class public final Lcom/melodix/music/NativeSearchWatcher;
.super Ljava/lang/Object;
.source "NativeSearchWatcher.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Ljava/lang/Runnable;


# static methods
# Arms a delayed second hide so a late re-show never lingers on screen.
.method public static postDismiss(Lcom/melodix/music/MainActivity;J)V
    .locals 3

    if-eqz p0, :post_done

    new-instance v0, Lcom/melodix/music/NativeHideImeRunnable;
    invoke-direct {v0, p0}, Lcom/melodix/music/NativeHideImeRunnable;-><init>(Lcom/melodix/music/MainActivity;)V
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    if-eqz v1, :post_done
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v1
    if-eqz v1, :post_done
    invoke-virtual {v1, v0, p1, p2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :post_done
    return-void
.end method

# Hides the soft keyboard when it is open (returns true then, or when the
# search field held focus). Used by Back (close keyboard first) and by screen
# changes (the keyboard must never linger over another screen).
.method public static dismissKeyboard(Lcom/melodix/music/MainActivity;)Z
    .locals 4

    const/4 v0, 0x0
    const/4 v1, 0x0
    const/4 v2, 0x0
    const/4 v3, 0x0
    if-nez p0, :dismiss_return

    const-string v2, "MDXTRACE"
    const-string v3, "ime-dismiss"
    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const v0, 0x7f090233
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :dismiss_hide
    invoke-virtual {v0}, Landroid/view/View;->isFocused()Z
    move-result v2
    if-eqz v2, :dismiss_clear
    const/4 v1, 0x1
    :dismiss_clear
    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    :dismiss_hide
    # Legacy hide (below API 30 and older IMEs).
    const-string v2, "input_method"
    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v2
    if-eqz v2, :dismiss_modern
    check-cast v2, Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v3
    if-eqz v3, :dismiss_modern
    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v3
    if-eqz v3, :dismiss_modern
    invoke-virtual {v3}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;
    move-result-object v3
    const/4 v0, 0x0
    invoke-virtual {v2, v3, v0}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z
    move-result v2
    if-eqz v2, :dismiss_modern
    const/4 v1, 0x1

    :dismiss_modern
    # API 30+: the window insets controller hides the IME reliably even
    # during a focus transition, where hideSoftInputFromWindow can miss.
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I
    const/16 v2, 0x1e
    if-ge v0, v2, :dismiss_return
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v2
    if-eqz v2, :dismiss_return
    invoke-virtual {v2}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;
    move-result-object v2
    if-eqz v2, :dismiss_return
    invoke-static {}, Landroid/view/WindowInsets$Type;->ime()I
    move-result v0
    invoke-virtual {v2, v0}, Landroid/view/WindowInsetsController;->hide(I)V
    const/4 v1, 0x1

    :dismiss_return
    return v1
.end method


# instance fields
.field private final activity:Lcom/melodix/music/MainActivity;

.field private final input:Landroid/widget/EditText;

.field private pendingQuery:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/melodix/music/MainActivity;Landroid/widget/EditText;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeSearchWatcher;->activity:Lcom/melodix/music/MainActivity;
    iput-object p2, p0, Lcom/melodix/music/NativeSearchWatcher;->input:Landroid/widget/EditText;
    return-void
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .locals 4

    iget-object v0, p0, Lcom/melodix/music/NativeSearchWatcher;->input:Landroid/widget/EditText;
    if-eqz v0, :done
    invoke-virtual {v0, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    if-eqz p1, :done
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/String;->length()I
    move-result v2
    const/4 v3, 0x2
    if-lt v2, v3, :done

    iput-object v1, p0, Lcom/melodix/music/NativeSearchWatcher;->pendingQuery:Ljava/lang/String;
    const-wide/16 v2, 0x118
    invoke-virtual {v0, p0, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :done
    return-void
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/melodix/music/NativeSearchWatcher;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v0, :not_handled
    invoke-virtual {v0, p1}, Lcom/melodix/music/MainActivity;->onNativeSearchSubmit(Landroid/view/View;)V
    const/4 v0, 0x1
    return v0

    :not_handled
    const/4 v0, 0x0
    return v0
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/melodix/music/NativeSearchWatcher;->activity:Lcom/melodix/music/MainActivity;
    iget-object v1, p0, Lcom/melodix/music/NativeSearchWatcher;->pendingQuery:Ljava/lang/String;
    if-eqz v0, :done
    if-eqz v1, :done
    invoke-virtual {v0, v1}, Lcom/melodix/music/MainActivity;->performNativeLiveSearch(Ljava/lang/String;)V

    :done
    return-void
.end method
