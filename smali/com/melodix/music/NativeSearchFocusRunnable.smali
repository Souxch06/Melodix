.class public final Lcom/melodix/music/NativeSearchFocusRunnable;
.super Ljava/lang/Object;
.source "NativeSearchFocusRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final activity:Lcom/melodix/music/MainActivity;

.field private final target:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/melodix/music/MainActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeSearchFocusRunnable;->activity:Lcom/melodix/music/MainActivity;
    iput-object p2, p0, Lcom/melodix/music/NativeSearchFocusRunnable;->target:Landroid/view/View;
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/melodix/music/NativeSearchFocusRunnable;->target:Landroid/view/View;
    if-eqz v0, :focus_done
    invoke-virtual {v0}, Landroid/view/View;->isShown()Z
    move-result v1
    if-nez v1, :focus_done

    iget-object v1, p0, Lcom/melodix/music/NativeSearchFocusRunnable;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v1, :focus_done
    const-string v2, "input_method"
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v2
    if-eqz v2, :focus_done
    check-cast v2, Landroid/view/inputmethod/InputMethodManager;
    const/4 v1, 0x0
    invoke-virtual {v2, v0, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    :focus_done
    return-void
.end method
