.class public final Lcom/melodix/music/NativeSearchWatcher;
.super Ljava/lang/Object;
.source "NativeSearchWatcher.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Ljava/lang/Runnable;


# static methods
# Hides the soft keyboard when it is open (returns true then, or when the
# search field held focus). Used by Back (close keyboard first) and by screen
# changes (the keyboard must never linger over another screen).
.method public static dismissKeyboard(Lcom/melodix/music/MainActivity;)Z
    .locals 4

    const/4 v1, 0x0
    if-nez p0, :dismiss_return

    const v0, 0x7f090233
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :dismiss_hide
    invoke-virtual {v0}, Landroid/view/View;->isFocused()Z
    move-result v2
    if-eqz v2, :dismiss_hide
    const/4 v1, 0x1
    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    :dismiss_hide
    const-string v2, "input_method"
    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v2
    if-eqz v2, :dismiss_return
    check-cast v2, Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v3
    if-eqz v3, :dismiss_return
    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v3
    if-eqz v3, :dismiss_return
    invoke-virtual {v3}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;
    move-result-object v3
    const/4 v0, 0x0
    invoke-virtual {v2, v3, v0}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z
    move-result v2
    if-eqz v2, :dismiss_return
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
