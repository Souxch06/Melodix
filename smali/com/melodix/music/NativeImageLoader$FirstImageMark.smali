.class public final Lcom/melodix/music/NativeImageLoader$FirstImageMark;
.super Ljava/lang/Object;
.implements Lcom/squareup/picasso/Callback;


.field public static reported:Z


# The first cover loaded into its ImageView is the moment the screen stops showing empty
# squares. Only ONE mark is emitted per measurement interval, so a shelf of 24 cards cannot
# flood the journal, and a slow image can never overwrite an earlier (better)
# measurement.
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method


.method public final onSuccess()V
    .locals 2

    sget-boolean v0, Lcom/melodix/music/NativeImageLoader$FirstImageMark;->reported:Z

    if-nez v0, :done

    const/4 v0, 0x1

    sput-boolean v0, Lcom/melodix/music/NativeImageLoader$FirstImageMark;->reported:Z

    const-string v0, "home-first-image"

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->perfMark(Ljava/lang/String;)V

    :done
    return-void
.end method


.method public final onError()V
    .locals 0

    # A failed image is not "displayed": report nothing rather than a fake mark.
    return-void
.end method
