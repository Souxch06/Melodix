.class public final Lcom/melodix/music/NativeShortcutClickListener;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;

# Dispatches to handlers that already exist and are verified on device. It adds
# no navigation mechanism and no business logic of its own.
.field private final activity:Lcom/melodix/music/MainActivity;
.field private final action:I

.method public constructor <init>(Lcom/melodix/music/MainActivity;I)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeShortcutClickListener;->activity:Lcom/melodix/music/MainActivity;
    iput p2, p0, Lcom/melodix/music/NativeShortcutClickListener;->action:I
    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .locals 2

    :try_start_click
    iget-object v0, p0, Lcom/melodix/music/NativeShortcutClickListener;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v0, :click_done
    iget v1, p0, Lcom/melodix/music/NativeShortcutClickListener;->action:I
    const/4 p1, 0x0
    if-eq v1, p1, :click_search
    const/4 p1, 0x1
    if-eq v1, p1, :click_library
    const/4 p1, 0x2
    if-eq v1, p1, :click_settings
    goto :click_done
    :click_search
    const/4 p1, 0x0
    invoke-virtual {v0, p1}, Lcom/melodix/music/MainActivity;->onNativeSearchClick(Landroid/view/View;)V
    goto :click_done
    :click_library
    const/4 p1, 0x0
    invoke-virtual {v0, p1}, Lcom/melodix/music/MainActivity;->onNativeLibraryClick(Landroid/view/View;)V
    goto :click_done
    :click_settings
    const/4 p1, 0x0
    invoke-virtual {v0, p1}, Lcom/melodix/music/MainActivity;->onNativeSettingsClick(Landroid/view/View;)V
    :try_end_click
    .catch Ljava/lang/Throwable; {:try_start_click .. :try_end_click} :click_catch
    goto :click_done
    :click_catch
    move-exception v0
    :click_done
    return-void
.end method
