.class public Landroidx/media/AudioAttributesCompat;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lfh1;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media/AudioAttributesCompat$AttributeContentType;,
        Landroidx/media/AudioAttributesCompat$AttributeUsage;,
        Landroidx/media/AudioAttributesCompat$AudioManagerHidden;,
        Landroidx/media/AudioAttributesCompat$Builder;
    }
.end annotation


# static fields
.field public static final CONTENT_TYPE_MOVIE:I = 0x3

.field public static final CONTENT_TYPE_MUSIC:I = 0x2

.field public static final CONTENT_TYPE_SONIFICATION:I = 0x4

.field public static final CONTENT_TYPE_SPEECH:I = 0x1

.field public static final CONTENT_TYPE_UNKNOWN:I = 0x0

.field static final FLAG_ALL:I = 0x3ff

.field static final FLAG_ALL_PUBLIC:I = 0x111

.field public static final FLAG_AUDIBILITY_ENFORCED:I = 0x1

.field static final FLAG_BEACON:I = 0x8

.field static final FLAG_BYPASS_INTERRUPTION_POLICY:I = 0x40

.field static final FLAG_BYPASS_MUTE:I = 0x80

.field static final FLAG_DEEP_BUFFER:I = 0x200

.field public static final FLAG_HW_AV_SYNC:I = 0x10

.field static final FLAG_HW_HOTWORD:I = 0x20

.field static final FLAG_LOW_LATENCY:I = 0x100

.field static final FLAG_SCO:I = 0x4

.field static final FLAG_SECURE:I = 0x2

.field static final INVALID_STREAM_TYPE:I = -0x1

.field private static final SDK_USAGES:[I

.field private static final SUPPRESSIBLE_CALL:I = 0x2

.field private static final SUPPRESSIBLE_NOTIFICATION:I = 0x1

.field private static final SUPPRESSIBLE_USAGES:Landroid/util/SparseIntArray;

.field static final TAG:Ljava/lang/String; = "AudioAttributesCompat"

.field public static final USAGE_ALARM:I = 0x4

.field public static final USAGE_ASSISTANCE_ACCESSIBILITY:I = 0xb

.field public static final USAGE_ASSISTANCE_NAVIGATION_GUIDANCE:I = 0xc

.field public static final USAGE_ASSISTANCE_SONIFICATION:I = 0xd

.field public static final USAGE_ASSISTANT:I = 0x10

.field public static final USAGE_GAME:I = 0xe

.field public static final USAGE_MEDIA:I = 0x1

.field public static final USAGE_NOTIFICATION:I = 0x5

.field public static final USAGE_NOTIFICATION_COMMUNICATION_DELAYED:I = 0x9

.field public static final USAGE_NOTIFICATION_COMMUNICATION_INSTANT:I = 0x8

.field public static final USAGE_NOTIFICATION_COMMUNICATION_REQUEST:I = 0x7

.field public static final USAGE_NOTIFICATION_EVENT:I = 0xa

.field public static final USAGE_NOTIFICATION_RINGTONE:I = 0x6

.field public static final USAGE_UNKNOWN:I = 0x0

.field static final USAGE_VIRTUAL_SOURCE:I = 0xf

.field public static final USAGE_VOICE_COMMUNICATION:I = 0x2

.field public static final USAGE_VOICE_COMMUNICATION_SIGNALLING:I = 0x3

.field static sForceLegacyBehavior:Z


# instance fields
.field public mImpl:Landroidx/media/AudioAttributesImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Landroid/util/SparseIntArray;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Landroidx/media/AudioAttributesCompat;->SUPPRESSIBLE_USAGES:Landroid/util/SparseIntArray;

    .line 7
    .line 8
    const/4 v1, 0x5

    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x6

    .line 14
    const/4 v3, 0x2

    .line 15
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->put(II)V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x7

    .line 19
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->put(II)V

    .line 20
    .line 21
    .line 22
    const/16 v1, 0x8

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 25
    .line 26
    .line 27
    const/16 v1, 0x9

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 30
    .line 31
    .line 32
    const/16 v1, 0xa

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 35
    .line 36
    .line 37
    const/16 v0, 0x10

    .line 38
    .line 39
    new-array v0, v0, [I

    .line 40
    .line 41
    fill-array-data v0, :array_0

    .line 42
    .line 43
    .line 44
    sput-object v0, Landroidx/media/AudioAttributesCompat;->SDK_USAGES:[I

    .line 45
    .line 46
    return-void

    .line 47
    :array_0
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
        0xd
        0xe
        0x10
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroidx/media/AudioAttributesImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/media/AudioAttributesCompat;->mImpl:Landroidx/media/AudioAttributesImpl;

    .line 5
    .line 6
    return-void
.end method

.method public static setForceLegacyBehavior(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Landroidx/media/AudioAttributesCompat;->sForceLegacyBehavior:Z

    .line 2
    .line 3
    return-void
.end method

.method public static toVolumeStreamType(ZII)I
    .locals 3

    .line 1
    and-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    const/4 p0, 0x7

    .line 10
    return p0

    .line 11
    :cond_1
    const/4 v0, 0x4

    .line 12
    and-int/2addr p1, v0

    .line 13
    const/4 v2, 0x0

    .line 14
    if-ne p1, v0, :cond_3

    .line 15
    .line 16
    if-eqz p0, :cond_2

    .line 17
    .line 18
    return v2

    .line 19
    :cond_2
    const/4 p0, 0x6

    .line 20
    return p0

    .line 21
    :cond_3
    const/4 p1, 0x3

    .line 22
    packed-switch p2, :pswitch_data_0

    .line 23
    .line 24
    .line 25
    :pswitch_0
    if-nez p0, :cond_4

    .line 26
    .line 27
    return p1

    .line 28
    :cond_4
    const-string p0, "Unknown usage value "

    .line 29
    .line 30
    const-string p1, " in audio attributes"

    .line 31
    .line 32
    invoke-static {p0, p1, p2}, Loq;->i(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    return p0

    .line 41
    :pswitch_1
    return v1

    .line 42
    :pswitch_2
    const/16 p0, 0xa

    .line 43
    .line 44
    return p0

    .line 45
    :pswitch_3
    const/4 p0, 0x2

    .line 46
    return p0

    .line 47
    :pswitch_4
    const/4 p0, 0x5

    .line 48
    return p0

    .line 49
    :pswitch_5
    return v0

    .line 50
    :pswitch_6
    if-eqz p0, :cond_5

    .line 51
    .line 52
    return v2

    .line 53
    :cond_5
    const/16 p0, 0x8

    .line 54
    .line 55
    return p0

    .line 56
    :pswitch_7
    return v2

    .line 57
    :pswitch_8
    return p1

    .line 58
    nop

    .line 59
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_2
        :pswitch_8
        :pswitch_1
        :pswitch_8
        :pswitch_0
        :pswitch_8
    .end packed-switch
.end method

.method public static usageToString(I)Ljava/lang/String;
    .locals 1

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    :pswitch_0
    const-string v0, "unknown usage "

    .line 5
    .line 6
    invoke-static {p0, v0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :pswitch_1
    const-string p0, "USAGE_ASSISTANT"

    .line 12
    .line 13
    return-object p0

    .line 14
    :pswitch_2
    const-string p0, "USAGE_GAME"

    .line 15
    .line 16
    return-object p0

    .line 17
    :pswitch_3
    const-string p0, "USAGE_ASSISTANCE_SONIFICATION"

    .line 18
    .line 19
    return-object p0

    .line 20
    :pswitch_4
    const-string p0, "USAGE_ASSISTANCE_NAVIGATION_GUIDANCE"

    .line 21
    .line 22
    return-object p0

    .line 23
    :pswitch_5
    const-string p0, "USAGE_ASSISTANCE_ACCESSIBILITY"

    .line 24
    .line 25
    return-object p0

    .line 26
    :pswitch_6
    const-string p0, "USAGE_NOTIFICATION_EVENT"

    .line 27
    .line 28
    return-object p0

    .line 29
    :pswitch_7
    const-string p0, "USAGE_NOTIFICATION_COMMUNICATION_DELAYED"

    .line 30
    .line 31
    return-object p0

    .line 32
    :pswitch_8
    const-string p0, "USAGE_NOTIFICATION_COMMUNICATION_INSTANT"

    .line 33
    .line 34
    return-object p0

    .line 35
    :pswitch_9
    const-string p0, "USAGE_NOTIFICATION_COMMUNICATION_REQUEST"

    .line 36
    .line 37
    return-object p0

    .line 38
    :pswitch_a
    const-string p0, "USAGE_NOTIFICATION_RINGTONE"

    .line 39
    .line 40
    return-object p0

    .line 41
    :pswitch_b
    const-string p0, "USAGE_NOTIFICATION"

    .line 42
    .line 43
    return-object p0

    .line 44
    :pswitch_c
    const-string p0, "USAGE_ALARM"

    .line 45
    .line 46
    return-object p0

    .line 47
    :pswitch_d
    const-string p0, "USAGE_VOICE_COMMUNICATION_SIGNALLING"

    .line 48
    .line 49
    return-object p0

    .line 50
    :pswitch_e
    const-string p0, "USAGE_VOICE_COMMUNICATION"

    .line 51
    .line 52
    return-object p0

    .line 53
    :pswitch_f
    const-string p0, "USAGE_MEDIA"

    .line 54
    .line 55
    return-object p0

    .line 56
    :pswitch_10
    const-string p0, "USAGE_UNKNOWN"

    .line 57
    .line 58
    return-object p0

    .line 59
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static wrap(Ljava/lang/Object;)Landroidx/media/AudioAttributesCompat;
    .locals 2

    .line 1
    sget-boolean v0, Landroidx/media/AudioAttributesCompat;->sForceLegacyBehavior:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    .line 9
    const/16 v1, 0x1a

    .line 10
    .line 11
    if-lt v0, v1, :cond_1

    .line 12
    .line 13
    new-instance v0, Landroidx/media/AudioAttributesCompat;

    .line 14
    .line 15
    new-instance v1, Landroidx/media/AudioAttributesImplApi26;

    .line 16
    .line 17
    check-cast p0, Landroid/media/AudioAttributes;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Landroidx/media/AudioAttributesImplApi26;-><init>(Landroid/media/AudioAttributes;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {v0, v1}, Landroidx/media/AudioAttributesCompat;-><init>(Landroidx/media/AudioAttributesImpl;)V

    .line 23
    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_1
    new-instance v0, Landroidx/media/AudioAttributesCompat;

    .line 27
    .line 28
    new-instance v1, Landroidx/media/AudioAttributesImplApi21;

    .line 29
    .line 30
    check-cast p0, Landroid/media/AudioAttributes;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Landroidx/media/AudioAttributesImplApi21;-><init>(Landroid/media/AudioAttributes;)V

    .line 33
    .line 34
    .line 35
    invoke-direct {v0, v1}, Landroidx/media/AudioAttributesCompat;-><init>(Landroidx/media/AudioAttributesImpl;)V

    .line 36
    .line 37
    .line 38
    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    instance-of v0, p1, Landroidx/media/AudioAttributesCompat;

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
    check-cast p1, Landroidx/media/AudioAttributesCompat;

    .line 8
    .line 9
    iget-object p0, p0, Landroidx/media/AudioAttributesCompat;->mImpl:Landroidx/media/AudioAttributesImpl;

    .line 10
    .line 11
    iget-object p1, p1, Landroidx/media/AudioAttributesCompat;->mImpl:Landroidx/media/AudioAttributesImpl;

    .line 12
    .line 13
    if-nez p0, :cond_2

    .line 14
    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    return v1

    .line 20
    :cond_2
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public getContentType()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/media/AudioAttributesCompat;->mImpl:Landroidx/media/AudioAttributesImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroidx/media/AudioAttributesImpl;->getContentType()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFlags()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/media/AudioAttributesCompat;->mImpl:Landroidx/media/AudioAttributesImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroidx/media/AudioAttributesImpl;->getFlags()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getLegacyStreamType()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/media/AudioAttributesCompat;->mImpl:Landroidx/media/AudioAttributesImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroidx/media/AudioAttributesImpl;->getLegacyStreamType()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getRawLegacyStreamType()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/media/AudioAttributesCompat;->mImpl:Landroidx/media/AudioAttributesImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroidx/media/AudioAttributesImpl;->getRawLegacyStreamType()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getUsage()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/media/AudioAttributesCompat;->mImpl:Landroidx/media/AudioAttributesImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroidx/media/AudioAttributesImpl;->getUsage()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getVolumeControlStream()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/media/AudioAttributesCompat;->mImpl:Landroidx/media/AudioAttributesImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroidx/media/AudioAttributesImpl;->getVolumeControlStream()I

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
    iget-object p0, p0, Landroidx/media/AudioAttributesCompat;->mImpl:Landroidx/media/AudioAttributesImpl;

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

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/media/AudioAttributesCompat;->mImpl:Landroidx/media/AudioAttributesImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public unwrap()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/media/AudioAttributesCompat;->mImpl:Landroidx/media/AudioAttributesImpl;

    .line 2
    .line 3
    invoke-interface {p0}, Landroidx/media/AudioAttributesImpl;->getAudioAttributes()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
