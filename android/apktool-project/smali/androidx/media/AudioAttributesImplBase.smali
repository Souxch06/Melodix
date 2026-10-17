.class public Landroidx/media/AudioAttributesImplBase;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroidx/media/AudioAttributesImpl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media/AudioAttributesImplBase$Builder;
    }
.end annotation


# instance fields
.field public mContentType:I

.field public mFlags:I

.field public mLegacyStream:I

.field public mUsage:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Landroidx/media/AudioAttributesImplBase;->mUsage:I

    .line 6
    .line 7
    iput v0, p0, Landroidx/media/AudioAttributesImplBase;->mContentType:I

    .line 8
    .line 9
    iput v0, p0, Landroidx/media/AudioAttributesImplBase;->mFlags:I

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Landroidx/media/AudioAttributesImplBase;->mLegacyStream:I

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput p1, p0, Landroidx/media/AudioAttributesImplBase;->mContentType:I

    .line 17
    iput p2, p0, Landroidx/media/AudioAttributesImplBase;->mFlags:I

    .line 18
    iput p3, p0, Landroidx/media/AudioAttributesImplBase;->mUsage:I

    .line 19
    iput p4, p0, Landroidx/media/AudioAttributesImplBase;->mLegacyStream:I

    return-void
.end method

.method public static usageForStreamType(I)I
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    packed-switch p0, :pswitch_data_0

    .line 3
    .line 4
    .line 5
    :pswitch_0
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :pswitch_1
    const/16 p0, 0xb

    .line 8
    .line 9
    return p0

    .line 10
    :pswitch_2
    const/4 p0, 0x3

    .line 11
    return p0

    .line 12
    :pswitch_3
    return v0

    .line 13
    :pswitch_4
    const/4 p0, 0x5

    .line 14
    return p0

    .line 15
    :pswitch_5
    const/4 p0, 0x4

    .line 16
    return p0

    .line 17
    :pswitch_6
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :pswitch_7
    const/4 p0, 0x6

    .line 20
    return p0

    .line 21
    :pswitch_8
    const/16 p0, 0xd

    .line 22
    .line 23
    return p0

    .line 24
    :pswitch_9
    return v0

    .line 25
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_8
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Landroidx/media/AudioAttributesImplBase;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Landroidx/media/AudioAttributesImplBase;

    .line 8
    .line 9
    iget v0, p0, Landroidx/media/AudioAttributesImplBase;->mContentType:I

    .line 10
    .line 11
    invoke-virtual {p1}, Landroidx/media/AudioAttributesImplBase;->getContentType()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ne v0, v2, :cond_1

    .line 16
    .line 17
    iget v0, p0, Landroidx/media/AudioAttributesImplBase;->mFlags:I

    .line 18
    .line 19
    invoke-virtual {p1}, Landroidx/media/AudioAttributesImplBase;->getFlags()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-ne v0, v2, :cond_1

    .line 24
    .line 25
    iget v0, p0, Landroidx/media/AudioAttributesImplBase;->mUsage:I

    .line 26
    .line 27
    invoke-virtual {p1}, Landroidx/media/AudioAttributesImplBase;->getUsage()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-ne v0, v2, :cond_1

    .line 32
    .line 33
    iget p0, p0, Landroidx/media/AudioAttributesImplBase;->mLegacyStream:I

    .line 34
    .line 35
    iget p1, p1, Landroidx/media/AudioAttributesImplBase;->mLegacyStream:I

    .line 36
    .line 37
    if-ne p0, p1, :cond_1

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_1
    return v1
.end method

.method public getAudioAttributes()Ljava/lang/Object;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getContentType()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/media/AudioAttributesImplBase;->mContentType:I

    .line 2
    .line 3
    return p0
.end method

.method public getFlags()I
    .locals 2

    .line 1
    iget v0, p0, Landroidx/media/AudioAttributesImplBase;->mFlags:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/media/AudioAttributesImplBase;->getLegacyStreamType()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v1, 0x6

    .line 8
    if-ne p0, v1, :cond_0

    .line 9
    .line 10
    or-int/lit8 v0, v0, 0x4

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v1, 0x7

    .line 14
    if-ne p0, v1, :cond_1

    .line 15
    .line 16
    or-int/lit8 v0, v0, 0x1

    .line 17
    .line 18
    :cond_1
    :goto_0
    and-int/lit16 p0, v0, 0x111

    .line 19
    .line 20
    return p0
.end method

.method public getLegacyStreamType()I
    .locals 2

    .line 1
    iget v0, p0, Landroidx/media/AudioAttributesImplBase;->mLegacyStream:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget v0, p0, Landroidx/media/AudioAttributesImplBase;->mFlags:I

    .line 8
    .line 9
    iget p0, p0, Landroidx/media/AudioAttributesImplBase;->mUsage:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {v1, v0, p0}, Landroidx/media/AudioAttributesCompat;->toVolumeStreamType(ZII)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public getRawLegacyStreamType()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/media/AudioAttributesImplBase;->mLegacyStream:I

    .line 2
    .line 3
    return p0
.end method

.method public getUsage()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/media/AudioAttributesImplBase;->mUsage:I

    .line 2
    .line 3
    return p0
.end method

.method public getVolumeControlStream()I
    .locals 2

    .line 1
    iget v0, p0, Landroidx/media/AudioAttributesImplBase;->mFlags:I

    .line 2
    .line 3
    iget p0, p0, Landroidx/media/AudioAttributesImplBase;->mUsage:I

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v1, v0, p0}, Landroidx/media/AudioAttributesCompat;->toVolumeStreamType(ZII)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Landroidx/media/AudioAttributesImplBase;->mContentType:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Landroidx/media/AudioAttributesImplBase;->mFlags:I

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget v2, p0, Landroidx/media/AudioAttributesImplBase;->mUsage:I

    .line 14
    .line 15
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget p0, p0, Landroidx/media/AudioAttributesImplBase;->mLegacyStream:I

    .line 20
    .line 21
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    filled-new-array {v0, v1, v2, p0}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AudioAttributesCompat:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Landroidx/media/AudioAttributesImplBase;->mLegacyStream:I

    .line 9
    .line 10
    const/4 v2, -0x1

    .line 11
    if-eq v1, v2, :cond_0

    .line 12
    .line 13
    const-string v1, " stream="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Landroidx/media/AudioAttributesImplBase;->mLegacyStream:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, " derived"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    :cond_0
    const-string v1, " usage="

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget v1, p0, Landroidx/media/AudioAttributesImplBase;->mUsage:I

    .line 34
    .line 35
    invoke-static {v1}, Landroidx/media/AudioAttributesCompat;->usageToString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v1, " content="

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget v1, p0, Landroidx/media/AudioAttributesImplBase;->mContentType:I

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v1, " flags=0x"

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget p0, p0, Landroidx/media/AudioAttributesImplBase;->mFlags:I

    .line 58
    .line 59
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method
