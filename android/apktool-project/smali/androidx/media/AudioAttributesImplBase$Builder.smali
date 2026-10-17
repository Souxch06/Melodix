.class Landroidx/media/AudioAttributesImplBase$Builder;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroidx/media/AudioAttributesImpl$Builder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/AudioAttributesImplBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mContentType:I

.field private mFlags:I

.field private mLegacyStream:I

.field private mUsage:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 40
    iput v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mUsage:I

    .line 41
    iput v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mContentType:I

    .line 42
    iput v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mFlags:I

    const/4 v0, -0x1

    .line 43
    iput v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mLegacyStream:I

    return-void
.end method

.method public constructor <init>(Landroidx/media/AudioAttributesCompat;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mUsage:I

    .line 6
    .line 7
    iput v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mContentType:I

    .line 8
    .line 9
    iput v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mFlags:I

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mLegacyStream:I

    .line 13
    .line 14
    invoke-virtual {p1}, Landroidx/media/AudioAttributesCompat;->getUsage()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mUsage:I

    .line 19
    .line 20
    invoke-virtual {p1}, Landroidx/media/AudioAttributesCompat;->getContentType()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iput v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mContentType:I

    .line 25
    .line 26
    invoke-virtual {p1}, Landroidx/media/AudioAttributesCompat;->getFlags()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mFlags:I

    .line 31
    .line 32
    invoke-virtual {p1}, Landroidx/media/AudioAttributesCompat;->getRawLegacyStreamType()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iput p1, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mLegacyStream:I

    .line 37
    .line 38
    return-void
.end method

.method private setInternalLegacyStreamType(I)Landroidx/media/AudioAttributesImplBase$Builder;
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x4

    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    goto :goto_1

    .line 7
    :pswitch_0
    iput v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mContentType:I

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :pswitch_1
    iput v1, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mContentType:I

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :pswitch_2
    iput v1, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mContentType:I

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :pswitch_3
    iget v2, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mFlags:I

    .line 17
    .line 18
    or-int/2addr v0, v2

    .line 19
    iput v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mFlags:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :pswitch_4
    iput v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mContentType:I

    .line 23
    .line 24
    iget v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mFlags:I

    .line 25
    .line 26
    or-int/2addr v0, v1

    .line 27
    iput v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mFlags:I

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :pswitch_5
    iput v1, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mContentType:I

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :pswitch_6
    iput v1, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mContentType:I

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :pswitch_7
    const/4 v0, 0x2

    .line 37
    iput v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mContentType:I

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :pswitch_8
    iput v1, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mContentType:I

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :goto_0
    :pswitch_9
    iput v1, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mContentType:I

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :pswitch_a
    iput v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mContentType:I

    .line 47
    .line 48
    :goto_1
    invoke-static {p1}, Landroidx/media/AudioAttributesImplBase;->usageForStreamType(I)I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iput p1, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mUsage:I

    .line 53
    .line 54
    return-object p0

    .line 55
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public build()Landroidx/media/AudioAttributesImpl;
    .locals 4

    .line 1
    new-instance v0, Landroidx/media/AudioAttributesImplBase;

    .line 2
    .line 3
    iget v1, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mContentType:I

    .line 4
    .line 5
    iget v2, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mFlags:I

    .line 6
    .line 7
    iget v3, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mUsage:I

    .line 8
    .line 9
    iget p0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mLegacyStream:I

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, v3, p0}, Landroidx/media/AudioAttributesImplBase;-><init>(IIII)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public bridge synthetic setContentType(I)Landroidx/media/AudioAttributesImpl$Builder;
    .locals 0

    .line 22
    invoke-virtual {p0, p1}, Landroidx/media/AudioAttributesImplBase$Builder;->setContentType(I)Landroidx/media/AudioAttributesImplBase$Builder;

    move-result-object p0

    return-object p0
.end method

.method public setContentType(I)Landroidx/media/AudioAttributesImplBase$Builder;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x4

    .line 13
    if-eq p1, v0, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput p1, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mContentType:I

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    iput p1, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mContentType:I

    .line 20
    .line 21
    return-object p0
.end method

.method public bridge synthetic setFlags(I)Landroidx/media/AudioAttributesImpl$Builder;
    .locals 0

    .line 9
    invoke-virtual {p0, p1}, Landroidx/media/AudioAttributesImplBase$Builder;->setFlags(I)Landroidx/media/AudioAttributesImplBase$Builder;

    move-result-object p0

    return-object p0
.end method

.method public setFlags(I)Landroidx/media/AudioAttributesImplBase$Builder;
    .locals 1

    .line 1
    and-int/lit16 p1, p1, 0x3ff

    .line 2
    .line 3
    iget v0, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mFlags:I

    .line 4
    .line 5
    or-int/2addr p1, v0

    .line 6
    iput p1, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mFlags:I

    .line 7
    .line 8
    return-object p0
.end method

.method public bridge synthetic setLegacyStreamType(I)Landroidx/media/AudioAttributesImpl$Builder;
    .locals 0

    .line 19
    invoke-virtual {p0, p1}, Landroidx/media/AudioAttributesImplBase$Builder;->setLegacyStreamType(I)Landroidx/media/AudioAttributesImplBase$Builder;

    move-result-object p0

    return-object p0
.end method

.method public setLegacyStreamType(I)Landroidx/media/AudioAttributesImplBase$Builder;
    .locals 1

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iput p1, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mLegacyStream:I

    .line 6
    .line 7
    invoke-direct {p0, p1}, Landroidx/media/AudioAttributesImplBase$Builder;->setInternalLegacyStreamType(I)Landroidx/media/AudioAttributesImplBase$Builder;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "STREAM_ACCESSIBILITY is not a legacy stream type that was used for audio playback"

    .line 13
    .line 14
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public bridge synthetic setUsage(I)Landroidx/media/AudioAttributesImpl$Builder;
    .locals 0

    .line 17
    invoke-virtual {p0, p1}, Landroidx/media/AudioAttributesImplBase$Builder;->setUsage(I)Landroidx/media/AudioAttributesImplBase$Builder;

    move-result-object p0

    return-object p0
.end method

.method public setUsage(I)Landroidx/media/AudioAttributesImplBase$Builder;
    .locals 0

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mUsage:I

    .line 6
    .line 7
    return-object p0

    .line 8
    :pswitch_0
    const/16 p1, 0xc

    .line 9
    .line 10
    iput p1, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mUsage:I

    .line 11
    .line 12
    return-object p0

    .line 13
    :pswitch_1
    iput p1, p0, Landroidx/media/AudioAttributesImplBase$Builder;->mUsage:I

    .line 14
    .line 15
    return-object p0

    .line 16
    nop

    .line 17
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
