.class public final Lcom/squareup/picasso/RequestHandler$Result;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/picasso/RequestHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Result"
.end annotation


# instance fields
.field private final bitmap:Landroid/graphics/Bitmap;

.field private final exifOrientation:I

.field private final loadedFrom:Lcom/squareup/picasso/Picasso$LoadedFrom;

.field private final source:Lp81;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;Lcom/squareup/picasso/Picasso$LoadedFrom;)V
    .locals 2

    .line 40
    const-string v0, "bitmap == null"

    invoke-static {p1, v0}, Lcom/squareup/picasso/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, p2, v1}, Lcom/squareup/picasso/RequestHandler$Result;-><init>(Landroid/graphics/Bitmap;Lp81;Lcom/squareup/picasso/Picasso$LoadedFrom;I)V

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;Lp81;Lcom/squareup/picasso/Picasso$LoadedFrom;I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    move v2, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v2, v0

    .line 11
    :goto_0
    if-eqz p2, :cond_1

    .line 12
    .line 13
    move v0, v1

    .line 14
    :cond_1
    if-eq v2, v0, :cond_2

    .line 15
    .line 16
    iput-object p1, p0, Lcom/squareup/picasso/RequestHandler$Result;->bitmap:Landroid/graphics/Bitmap;

    .line 17
    .line 18
    iput-object p2, p0, Lcom/squareup/picasso/RequestHandler$Result;->source:Lp81;

    .line 19
    .line 20
    const-string p1, "loadedFrom == null"

    .line 21
    .line 22
    invoke-static {p3, p1}, Lcom/squareup/picasso/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/squareup/picasso/Picasso$LoadedFrom;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/squareup/picasso/RequestHandler$Result;->loadedFrom:Lcom/squareup/picasso/Picasso$LoadedFrom;

    .line 29
    .line 30
    iput p4, p0, Lcom/squareup/picasso/RequestHandler$Result;->exifOrientation:I

    .line 31
    .line 32
    return-void

    .line 33
    :cond_2
    new-instance p0, Ljava/lang/AssertionError;

    .line 34
    .line 35
    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    .line 36
    .line 37
    .line 38
    throw p0
.end method

.method public constructor <init>(Lp81;Lcom/squareup/picasso/Picasso$LoadedFrom;)V
    .locals 2

    .line 39
    const-string v0, "source == null"

    invoke-static {p1, v0}, Lcom/squareup/picasso/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lp81;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v1, p1, p2, v0}, Lcom/squareup/picasso/RequestHandler$Result;-><init>(Landroid/graphics/Bitmap;Lp81;Lcom/squareup/picasso/Picasso$LoadedFrom;I)V

    return-void
.end method


# virtual methods
.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/RequestHandler$Result;->bitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExifOrientation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/squareup/picasso/RequestHandler$Result;->exifOrientation:I

    .line 2
    .line 3
    return p0
.end method

.method public getLoadedFrom()Lcom/squareup/picasso/Picasso$LoadedFrom;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/RequestHandler$Result;->loadedFrom:Lcom/squareup/picasso/Picasso$LoadedFrom;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSource()Lp81;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/RequestHandler$Result;->source:Lp81;

    .line 2
    .line 3
    return-object p0
.end method
