# Keeps the mini-player and the bottom navigation reachable while the soft
# keyboard is open: the keyboard overlap becomes bottom padding of the content
# frame. Overlap-based, so it is a no-op when the window is already resized
# (legacy adjustResize) and a real fix where the window stays behind the IME
# (API 35 enforced edge-to-edge).
.class public final Lcom/melodix/music/NativeImeInsetsListener;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# instance fields
.field private baseBottom:I

.field private baseCaptured:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static install(Landroid/app/Activity;)V
    .locals 2

    const/4 v0, 0x0
    const/4 v1, 0x0
    if-eqz p0, :install_done

    const v0, 0x01020002
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :install_done

    new-instance v1, Lcom/melodix/music/NativeImeInsetsListener;
    invoke-direct {v1}, Lcom/melodix/music/NativeImeInsetsListener;-><init>()V
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    :install_done
    return-void
.end method


# virtual methods
.method public onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 5

    const/4 v0, 0x0
    const/4 v1, 0x0
    const/4 v2, 0x0
    const/4 v3, 0x0
    const/4 v4, 0x0

    if-eqz p2, :ime_keep
    if-eqz p1, :ime_keep

    # WindowInsets.Type exists from API 30 only; below, adjustResize already
    # resizes the window and there is nothing to pad.
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I
    const/16 v2, 0x1e
    if-ge v0, v2, :ime_keep

    # How much the keyboard overlaps the bottom of the window right now.
    invoke-static {}, Landroid/view/WindowInsets$Type;->ime()I
    move-result v0
    invoke-virtual {p2, v0}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;
    move-result-object v3
    if-eqz v3, :ime_keep
    iget v0, v3, Landroid/graphics/Insets;->bottom:I

    # Remember the layout's own bottom padding once.
    iget-boolean v2, p0, Lcom/melodix/music/NativeImeInsetsListener;->baseCaptured:Z
    if-nez v2, :ime_have_base
    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I
    move-result v2
    iput v2, p0, Lcom/melodix/music/NativeImeInsetsListener;->baseBottom:I
    const/4 v2, 0x1
    iput-boolean v2, p0, Lcom/melodix/music/NativeImeInsetsListener;->baseCaptured:Z

    :ime_have_base
    iget v1, p0, Lcom/melodix/music/NativeImeInsetsListener;->baseBottom:I
    add-int/2addr v1, v0
    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I
    move-result v2
    if-ne v2, v1, :ime_keep

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I
    move-result v2
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I
    move-result v4
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I
    move-result v0
    invoke-virtual {p1, v2, v4, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    :ime_keep
    return-object p2
.end method
