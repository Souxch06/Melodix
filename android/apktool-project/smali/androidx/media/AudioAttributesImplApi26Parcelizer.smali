.class public Landroidx/media/AudioAttributesImplApi26Parcelizer;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static read(Ldh1;)Landroidx/media/AudioAttributesImplApi26;
    .locals 3

    .line 1
    new-instance v0, Landroidx/media/AudioAttributesImplApi26;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/media/AudioAttributesImplApi26;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Landroidx/media/AudioAttributesImplApi21;->mAudioAttributes:Landroid/media/AudioAttributes;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-virtual {p0, v1, v2}, Ldh1;->g(Landroid/os/Parcelable;I)Landroid/os/Parcelable;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Landroid/media/AudioAttributes;

    .line 14
    .line 15
    iput-object v1, v0, Landroidx/media/AudioAttributesImplApi21;->mAudioAttributes:Landroid/media/AudioAttributes;

    .line 16
    .line 17
    iget v1, v0, Landroidx/media/AudioAttributesImplApi21;->mLegacyStreamType:I

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    invoke-virtual {p0, v1, v2}, Ldh1;->f(II)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    iput p0, v0, Landroidx/media/AudioAttributesImplApi21;->mLegacyStreamType:I

    .line 25
    .line 26
    return-object v0
.end method

.method public static write(Landroidx/media/AudioAttributesImplApi26;Ldh1;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/media/AudioAttributesImplApi21;->mAudioAttributes:Landroid/media/AudioAttributes;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {p1, v0, v1}, Ldh1;->k(Landroid/os/Parcelable;I)V

    .line 8
    .line 9
    .line 10
    iget p0, p0, Landroidx/media/AudioAttributesImplApi21;->mLegacyStreamType:I

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    invoke-virtual {p1, p0, v0}, Ldh1;->j(II)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
