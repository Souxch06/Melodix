.class Lcom/squareup/picasso/LruCache$1;
.super Landroid/util/LruCache;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/squareup/picasso/LruCache;-><init>(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/LruCache<",
        "Ljava/lang/String;",
        "Lcom/squareup/picasso/LruCache$BitmapAndSize;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/picasso/LruCache;


# direct methods
.method public constructor <init>(Lcom/squareup/picasso/LruCache;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/squareup/picasso/LruCache$1;->this$0:Lcom/squareup/picasso/LruCache;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/util/LruCache;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    check-cast p2, Lcom/squareup/picasso/LruCache$BitmapAndSize;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/squareup/picasso/LruCache$1;->sizeOf(Ljava/lang/String;Lcom/squareup/picasso/LruCache$BitmapAndSize;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public sizeOf(Ljava/lang/String;Lcom/squareup/picasso/LruCache$BitmapAndSize;)I
    .locals 0

    .line 10
    iget p0, p2, Lcom/squareup/picasso/LruCache$BitmapAndSize;->byteCount:I

    return p0
.end method
