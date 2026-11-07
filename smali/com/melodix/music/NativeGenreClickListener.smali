.class final Lcom/melodix/music/NativeGenreClickListener;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;

# Explicit wiring for the browse tiles. android:onClick on the tile FrameLayouts
# provably never fired: the tap landed on the enabled "Pop" tile at its centre and
# the handler produced no trace and no crash. Setting the listener in code both
# removes that dependency and gives a trace at the exact entry point.

.field private final activity:Lcom/melodix/music/MainActivity;

.method public constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeGenreClickListener;->activity:Lcom/melodix/music/MainActivity;
    return-void
.end method

# p1 is the clicked View and must survive the logging: overwriting it would call
# the handler with null and crash on getTag().
.method public final onClick(Landroid/view/View;)V
    .locals 2
    iget-object v0, p0, Lcom/melodix/music/NativeGenreClickListener;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v0, :genre_click_done
    const-string v1, "MelGenre"
    const-string v0, "tile click received"
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    iget-object v0, p0, Lcom/melodix/music/NativeGenreClickListener;->activity:Lcom/melodix/music/MainActivity;
    invoke-virtual {v0, p1}, Lcom/melodix/music/MainActivity;->onNativeGenreClick(Landroid/view/View;)V
    :genre_click_done
    return-void
.end method
