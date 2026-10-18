.class public Landroidx/media/AudioAttributesCompat$Builder;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/AudioAttributesCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field final mBuilderImpl:Landroidx/media/AudioAttributesImpl$Builder;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    sget-boolean v0, Landroidx/media/AudioAttributesCompat;->sForceLegacyBehavior:Z

    if-eqz v0, :cond_0

    .line 48
    new-instance v0, Landroidx/media/AudioAttributesImplBase$Builder;

    invoke-direct {v0}, Landroidx/media/AudioAttributesImplBase$Builder;-><init>()V

    iput-object v0, p0, Landroidx/media/AudioAttributesCompat$Builder;->mBuilderImpl:Landroidx/media/AudioAttributesImpl$Builder;

    return-void

    .line 49
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_1

    .line 50
    new-instance v0, Landroidx/media/AudioAttributesImplApi26$Builder;

    invoke-direct {v0}, Landroidx/media/AudioAttributesImplApi26$Builder;-><init>()V

    iput-object v0, p0, Landroidx/media/AudioAttributesCompat$Builder;->mBuilderImpl:Landroidx/media/AudioAttributesImpl$Builder;

    return-void

    .line 51
    :cond_1
    new-instance v0, Landroidx/media/AudioAttributesImplApi21$Builder;

    invoke-direct {v0}, Landroidx/media/AudioAttributesImplApi21$Builder;-><init>()V

    iput-object v0, p0, Landroidx/media/AudioAttributesCompat$Builder;->mBuilderImpl:Landroidx/media/AudioAttributesImpl$Builder;

    return-void
.end method

.method public constructor <init>(Landroidx/media/AudioAttributesCompat;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-boolean v0, Landroidx/media/AudioAttributesCompat;->sForceLegacyBehavior:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Landroidx/media/AudioAttributesImplBase$Builder;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Landroidx/media/AudioAttributesImplBase$Builder;-><init>(Landroidx/media/AudioAttributesCompat;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Landroidx/media/AudioAttributesCompat$Builder;->mBuilderImpl:Landroidx/media/AudioAttributesImpl$Builder;

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 17
    .line 18
    const/16 v1, 0x1a

    .line 19
    .line 20
    if-lt v0, v1, :cond_1

    .line 21
    .line 22
    new-instance v0, Landroidx/media/AudioAttributesImplApi26$Builder;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroidx/media/AudioAttributesCompat;->unwrap()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-direct {v0, p1}, Landroidx/media/AudioAttributesImplApi26$Builder;-><init>(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Landroidx/media/AudioAttributesCompat$Builder;->mBuilderImpl:Landroidx/media/AudioAttributesImpl$Builder;

    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    new-instance v0, Landroidx/media/AudioAttributesImplApi21$Builder;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroidx/media/AudioAttributesCompat;->unwrap()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-direct {v0, p1}, Landroidx/media/AudioAttributesImplApi21$Builder;-><init>(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Landroidx/media/AudioAttributesCompat$Builder;->mBuilderImpl:Landroidx/media/AudioAttributesImpl$Builder;

    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method public build()Landroidx/media/AudioAttributesCompat;
    .locals 1

    .line 1
    new-instance v0, Landroidx/media/AudioAttributesCompat;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/media/AudioAttributesCompat$Builder;->mBuilderImpl:Landroidx/media/AudioAttributesImpl$Builder;

    .line 4
    .line 5
    invoke-interface {p0}, Landroidx/media/AudioAttributesImpl$Builder;->build()Landroidx/media/AudioAttributesImpl;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p0}, Landroidx/media/AudioAttributesCompat;-><init>(Landroidx/media/AudioAttributesImpl;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public setContentType(I)Landroidx/media/AudioAttributesCompat$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/media/AudioAttributesCompat$Builder;->mBuilderImpl:Landroidx/media/AudioAttributesImpl$Builder;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Landroidx/media/AudioAttributesImpl$Builder;->setContentType(I)Landroidx/media/AudioAttributesImpl$Builder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public setFlags(I)Landroidx/media/AudioAttributesCompat$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/media/AudioAttributesCompat$Builder;->mBuilderImpl:Landroidx/media/AudioAttributesImpl$Builder;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Landroidx/media/AudioAttributesImpl$Builder;->setFlags(I)Landroidx/media/AudioAttributesImpl$Builder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public setLegacyStreamType(I)Landroidx/media/AudioAttributesCompat$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/media/AudioAttributesCompat$Builder;->mBuilderImpl:Landroidx/media/AudioAttributesImpl$Builder;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Landroidx/media/AudioAttributesImpl$Builder;->setLegacyStreamType(I)Landroidx/media/AudioAttributesImpl$Builder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public setUsage(I)Landroidx/media/AudioAttributesCompat$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/media/AudioAttributesCompat$Builder;->mBuilderImpl:Landroidx/media/AudioAttributesImpl$Builder;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Landroidx/media/AudioAttributesImpl$Builder;->setUsage(I)Landroidx/media/AudioAttributesImpl$Builder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
