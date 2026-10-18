.class public interface abstract Lcom/squareup/picasso/Cache;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final NONE:Lcom/squareup/picasso/Cache;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/squareup/picasso/Cache$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/squareup/picasso/Cache$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/squareup/picasso/Cache;->NONE:Lcom/squareup/picasso/Cache;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public abstract clear()V
.end method

.method public abstract clearKeyUri(Ljava/lang/String;)V
.end method

.method public abstract get(Ljava/lang/String;)Landroid/graphics/Bitmap;
.end method

.method public abstract maxSize()I
.end method

.method public abstract set(Ljava/lang/String;Landroid/graphics/Bitmap;)V
.end method

.method public abstract size()I
.end method
