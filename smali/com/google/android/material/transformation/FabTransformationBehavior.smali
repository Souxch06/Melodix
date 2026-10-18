.class public abstract Lcom/google/android/material/transformation/FabTransformationBehavior;
.super Lcom/google/android/material/transformation/ExpandableTransformationBehavior;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/transformation/ExpandableTransformationBehavior;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p0, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance p0, Landroid/graphics/RectF;

    .line 10
    .line 11
    invoke-direct {p0}, Landroid/graphics/RectF;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance p0, Landroid/graphics/RectF;

    .line 15
    .line 16
    invoke-direct {p0}, Landroid/graphics/RectF;-><init>()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/transformation/ExpandableTransformationBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    new-instance p0, Landroid/graphics/Rect;

    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    .line 22
    new-instance p0, Landroid/graphics/RectF;

    invoke-direct {p0}, Landroid/graphics/RectF;-><init>()V

    .line 23
    new-instance p0, Landroid/graphics/RectF;

    invoke-direct {p0}, Landroid/graphics/RectF;-><init>()V

    return-void
.end method
