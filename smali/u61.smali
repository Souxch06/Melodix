.class public final Lu61;
.super La71;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic c:Ljava/util/ArrayList;

.field public final synthetic d:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Landroid/graphics/Matrix;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lu61;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    iput-object p2, p0, Lu61;->d:Landroid/graphics/Matrix;

    .line 4
    .line 5
    invoke-direct {p0}, La71;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Matrix;Lp61;ILandroid/graphics/Canvas;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lu61;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    add-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    check-cast v2, La71;

    .line 17
    .line 18
    iget-object v3, p0, Lu61;->d:Landroid/graphics/Matrix;

    .line 19
    .line 20
    invoke-virtual {v2, v3, p2, p3, p4}, La71;->a(Landroid/graphics/Matrix;Lp61;ILandroid/graphics/Canvas;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method
