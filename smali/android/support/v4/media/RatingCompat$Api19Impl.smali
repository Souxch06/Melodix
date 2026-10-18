.class Landroid/support/v4/media/RatingCompat$Api19Impl;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/RatingCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Api19Impl"
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

.method public static getPercentRating(Landroid/media/Rating;)F
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/media/Rating;->getPercentRating()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static getRatingStyle(Landroid/media/Rating;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/media/Rating;->getRatingStyle()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static getStarRating(Landroid/media/Rating;)F
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/media/Rating;->getStarRating()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static hasHeart(Landroid/media/Rating;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/media/Rating;->hasHeart()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static isRated(Landroid/media/Rating;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/media/Rating;->isRated()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static isThumbUp(Landroid/media/Rating;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/media/Rating;->isThumbUp()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static newHeartRating(Z)Landroid/media/Rating;
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/media/Rating;->newHeartRating(Z)Landroid/media/Rating;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static newPercentageRating(F)Landroid/media/Rating;
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/media/Rating;->newPercentageRating(F)Landroid/media/Rating;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static newStarRating(IF)Landroid/media/Rating;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroid/media/Rating;->newStarRating(IF)Landroid/media/Rating;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static newThumbRating(Z)Landroid/media/Rating;
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/media/Rating;->newThumbRating(Z)Landroid/media/Rating;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static newUnratedRating(I)Landroid/media/Rating;
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/media/Rating;->newUnratedRating(I)Landroid/media/Rating;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
