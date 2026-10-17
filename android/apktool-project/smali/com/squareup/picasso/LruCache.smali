.class public final Lcom/squareup/picasso/LruCache;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lcom/squareup/picasso/Cache;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/picasso/LruCache$BitmapAndSize;
    }
.end annotation


# instance fields
.field final cache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "Lcom/squareup/picasso/LruCache$BitmapAndSize;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/squareup/picasso/LruCache$1;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lcom/squareup/picasso/LruCache$1;-><init>(Lcom/squareup/picasso/LruCache;I)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/squareup/picasso/LruCache;->cache:Landroid/util/LruCache;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 12
    invoke-static {p1}, Lcom/squareup/picasso/Utils;->calculateMemoryCacheSize(Landroid/content/Context;)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/squareup/picasso/LruCache;-><init>(I)V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/LruCache;->cache:Landroid/util/LruCache;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/util/LruCache;->evictAll()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public clearKeyUri(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/squareup/picasso/LruCache;->cache:Landroid/util/LruCache;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/util/LruCache;->snapshot()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v1, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-le v2, v3, :cond_0

    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    const/16 v3, 0xa

    .line 52
    .line 53
    if-ne v2, v3, :cond_0

    .line 54
    .line 55
    iget-object v2, p0, Lcom/squareup/picasso/LruCache;->cache:Landroid/util/LruCache;

    .line 56
    .line 57
    invoke-virtual {v2, v1}, Landroid/util/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    return-void
.end method

.method public evictionCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/LruCache;->cache:Landroid/util/LruCache;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/util/LruCache;->evictionCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public get(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/LruCache;->cache:Landroid/util/LruCache;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/squareup/picasso/LruCache$BitmapAndSize;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/squareup/picasso/LruCache$BitmapAndSize;->bitmap:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public hitCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/LruCache;->cache:Landroid/util/LruCache;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/util/LruCache;->hitCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public maxSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/LruCache;->cache:Landroid/util/LruCache;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/util/LruCache;->maxSize()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public missCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/LruCache;->cache:Landroid/util/LruCache;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/util/LruCache;->missCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public putCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/LruCache;->cache:Landroid/util/LruCache;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/util/LruCache;->putCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public set(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    invoke-static {p2}, Lcom/squareup/picasso/Utils;->getBitmapBytes(Landroid/graphics/Bitmap;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Lcom/squareup/picasso/LruCache;->maxSize()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object p0, p0, Lcom/squareup/picasso/LruCache;->cache:Landroid/util/LruCache;

    .line 14
    .line 15
    if-le v0, v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/util/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    new-instance v1, Lcom/squareup/picasso/LruCache$BitmapAndSize;

    .line 22
    .line 23
    invoke-direct {v1, p2, v0}, Lcom/squareup/picasso/LruCache$BitmapAndSize;-><init>(Landroid/graphics/Bitmap;I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1, v1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    const-string p0, "key == null || bitmap == null"

    .line 31
    .line 32
    invoke-static {p0}, Lwd1;->d(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public size()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/LruCache;->cache:Landroid/util/LruCache;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/util/LruCache;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
