.class Landroidx/media/AudioAttributesImplApi21$Builder;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroidx/media/AudioAttributesImpl$Builder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/AudioAttributesImplApi21;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field final mFwkBuilder:Landroid/media/AudioAttributes$Builder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v0, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v0}, Landroid/media/AudioAttributes$Builder;-><init>()V

    iput-object v0, p0, Landroidx/media/AudioAttributesImplApi21$Builder;->mFwkBuilder:Landroid/media/AudioAttributes$Builder;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/media/AudioAttributes$Builder;

    .line 5
    .line 6
    check-cast p1, Landroid/media/AudioAttributes;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Landroid/media/AudioAttributes$Builder;-><init>(Landroid/media/AudioAttributes;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Landroidx/media/AudioAttributesImplApi21$Builder;->mFwkBuilder:Landroid/media/AudioAttributes$Builder;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public build()Landroidx/media/AudioAttributesImpl;
    .locals 1

    .line 1
    new-instance v0, Landroidx/media/AudioAttributesImplApi21;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/media/AudioAttributesImplApi21$Builder;->mFwkBuilder:Landroid/media/AudioAttributes$Builder;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p0}, Landroidx/media/AudioAttributesImplApi21;-><init>(Landroid/media/AudioAttributes;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public bridge synthetic setContentType(I)Landroidx/media/AudioAttributesImpl$Builder;
    .locals 0

    .line 7
    invoke-virtual {p0, p1}, Landroidx/media/AudioAttributesImplApi21$Builder;->setContentType(I)Landroidx/media/AudioAttributesImplApi21$Builder;

    move-result-object p0

    return-object p0
.end method

.method public setContentType(I)Landroidx/media/AudioAttributesImplApi21$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/media/AudioAttributesImplApi21$Builder;->mFwkBuilder:Landroid/media/AudioAttributes$Builder;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic setFlags(I)Landroidx/media/AudioAttributesImpl$Builder;
    .locals 0

    .line 7
    invoke-virtual {p0, p1}, Landroidx/media/AudioAttributesImplApi21$Builder;->setFlags(I)Landroidx/media/AudioAttributesImplApi21$Builder;

    move-result-object p0

    return-object p0
.end method

.method public setFlags(I)Landroidx/media/AudioAttributesImplApi21$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/media/AudioAttributesImplApi21$Builder;->mFwkBuilder:Landroid/media/AudioAttributes$Builder;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/media/AudioAttributes$Builder;->setFlags(I)Landroid/media/AudioAttributes$Builder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic setLegacyStreamType(I)Landroidx/media/AudioAttributesImpl$Builder;
    .locals 0

    .line 7
    invoke-virtual {p0, p1}, Landroidx/media/AudioAttributesImplApi21$Builder;->setLegacyStreamType(I)Landroidx/media/AudioAttributesImplApi21$Builder;

    move-result-object p0

    return-object p0
.end method

.method public setLegacyStreamType(I)Landroidx/media/AudioAttributesImplApi21$Builder;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/media/AudioAttributesImplApi21$Builder;->mFwkBuilder:Landroid/media/AudioAttributes$Builder;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/media/AudioAttributes$Builder;->setLegacyStreamType(I)Landroid/media/AudioAttributes$Builder;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic setUsage(I)Landroidx/media/AudioAttributesImpl$Builder;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Landroidx/media/AudioAttributesImplApi21$Builder;->setUsage(I)Landroidx/media/AudioAttributesImplApi21$Builder;

    move-result-object p0

    return-object p0
.end method

.method public setUsage(I)Landroidx/media/AudioAttributesImplApi21$Builder;
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/16 p1, 0xc

    .line 6
    .line 7
    :cond_0
    iget-object v0, p0, Landroidx/media/AudioAttributesImplApi21$Builder;->mFwkBuilder:Landroid/media/AudioAttributes$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    .line 10
    .line 11
    .line 12
    return-object p0
.end method
