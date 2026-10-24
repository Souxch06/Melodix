# Delayed second hide: any component that re-shows the keyboard right after a
# screen change is closed again.
.class public final Lcom/melodix/music/NativeHideImeRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;


# instance fields
.field private final activity:Lcom/melodix/music/MainActivity;


# direct methods
.method public constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeHideImeRunnable;->activity:Lcom/melodix/music/MainActivity;
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/melodix/music/NativeHideImeRunnable;->activity:Lcom/melodix/music/MainActivity;
    invoke-static {v0}, Lcom/melodix/music/NativeSearchWatcher;->dismissKeyboard(Lcom/melodix/music/MainActivity;)Z

    return-void
.end method
