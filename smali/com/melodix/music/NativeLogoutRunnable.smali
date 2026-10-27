.class final Lcom/melodix/music/NativeLogoutRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# Clears the Spotify session on the UI thread, then restarts the app on the
# login screen. Reuses the activity's own logout routine instead of touching
# cookies or tokens from JavaScript.

.field private final activity:Lcom/melodix/music/MainActivity;


.method public constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeLogoutRunnable;->activity:Lcom/melodix/music/MainActivity;
    return-void
.end method


.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/melodix/music/NativeLogoutRunnable;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v0, :native_logout_done
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->A()V

    :native_logout_done
    return-void
.end method
