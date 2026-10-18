.class public final Landroidx/media/MediaSessionManager$RemoteUserInfo;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/MediaSessionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RemoteUserInfo"
.end annotation


# static fields
.field public static final LEGACY_CONTROLLER:Ljava/lang/String; = "android.media.session.MediaController"

.field public static final UNKNOWN_PID:I = -0x1

.field public static final UNKNOWN_UID:I = -0x1


# instance fields
.field mImpl:Landroidx/media/MediaSessionManager$RemoteUserInfoImpl;


# direct methods
.method public constructor <init>(Landroid/media/session/MediaSessionManager$RemoteUserInfo;)V
    .locals 2

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    invoke-static {p1}, Landroidx/media/MediaSessionManagerImplApi28$RemoteUserInfoImplApi28;->getPackageName(Landroid/media/session/MediaSessionManager$RemoteUserInfo;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 49
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 50
    new-instance v0, Landroidx/media/MediaSessionManagerImplApi28$RemoteUserInfoImplApi28;

    invoke-direct {v0, p1}, Landroidx/media/MediaSessionManagerImplApi28$RemoteUserInfoImplApi28;-><init>(Landroid/media/session/MediaSessionManager$RemoteUserInfo;)V

    iput-object v0, p0, Landroidx/media/MediaSessionManager$RemoteUserInfo;->mImpl:Landroidx/media/MediaSessionManager$RemoteUserInfoImpl;

    return-void

    .line 51
    :cond_0
    const-string p0, "packageName should be nonempty"

    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    throw v1

    .line 52
    :cond_1
    const-string p0, "package shouldn\'t be null"

    invoke-static {p0}, Lwd1;->d(Ljava/lang/String;)V

    throw v1
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 14
    .line 15
    const/16 v1, 0x1c

    .line 16
    .line 17
    if-lt v0, v1, :cond_0

    .line 18
    .line 19
    new-instance v0, Landroidx/media/MediaSessionManagerImplApi28$RemoteUserInfoImplApi28;

    .line 20
    .line 21
    invoke-direct {v0, p1, p2, p3}, Landroidx/media/MediaSessionManagerImplApi28$RemoteUserInfoImplApi28;-><init>(Ljava/lang/String;II)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Landroidx/media/MediaSessionManager$RemoteUserInfo;->mImpl:Landroidx/media/MediaSessionManager$RemoteUserInfoImpl;

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    new-instance v0, Landroidx/media/MediaSessionManagerImplBase$RemoteUserInfoImplBase;

    .line 28
    .line 29
    invoke-direct {v0, p1, p2, p3}, Landroidx/media/MediaSessionManagerImplBase$RemoteUserInfoImplBase;-><init>(Ljava/lang/String;II)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Landroidx/media/MediaSessionManager$RemoteUserInfo;->mImpl:Landroidx/media/MediaSessionManager$RemoteUserInfoImpl;

    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    const-string p0, "packageName should be nonempty"

    .line 36
    .line 37
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw v0

    .line 41
    :cond_2
    const-string p0, "package shouldn\'t be null"

    .line 42
    .line 43
    invoke-static {p0}, Lwd1;->d(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p1, Landroidx/media/MediaSessionManager$RemoteUserInfo;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    iget-object p0, p0, Landroidx/media/MediaSessionManager$RemoteUserInfo;->mImpl:Landroidx/media/MediaSessionManager$RemoteUserInfoImpl;

    .line 12
    .line 13
    check-cast p1, Landroidx/media/MediaSessionManager$RemoteUserInfo;

    .line 14
    .line 15
    iget-object p1, p1, Landroidx/media/MediaSessionManager$RemoteUserInfo;->mImpl:Landroidx/media/MediaSessionManager$RemoteUserInfoImpl;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/media/MediaSessionManager$RemoteUserInfo;->mImpl:Landroidx/media/MediaSessionManager$RemoteUserInfoImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroidx/media/MediaSessionManager$RemoteUserInfoImpl;->getPackageName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getPid()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/media/MediaSessionManager$RemoteUserInfo;->mImpl:Landroidx/media/MediaSessionManager$RemoteUserInfoImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroidx/media/MediaSessionManager$RemoteUserInfoImpl;->getPid()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getUid()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/media/MediaSessionManager$RemoteUserInfo;->mImpl:Landroidx/media/MediaSessionManager$RemoteUserInfoImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroidx/media/MediaSessionManager$RemoteUserInfoImpl;->getUid()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/media/MediaSessionManager$RemoteUserInfo;->mImpl:Landroidx/media/MediaSessionManager$RemoteUserInfoImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
