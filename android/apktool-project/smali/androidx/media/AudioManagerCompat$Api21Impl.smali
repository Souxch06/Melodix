.class Landroidx/media/AudioManagerCompat$Api21Impl;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media/AudioManagerCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Api21Impl"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static isVolumeFixed(Landroid/media/AudioManager;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/media/AudioManager;->isVolumeFixed()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
