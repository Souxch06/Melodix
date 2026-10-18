.class public final Lmb0;
.super Lih0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lp80;


# instance fields
.field public final synthetic k:I

.field public final synthetic l:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(ILjava/util/List;)V
    .locals 0

    .line 1
    iput p1, p0, Lmb0;->k:I

    .line 2
    .line 3
    iput-object p2, p0, Lmb0;->l:Ljava/util/List;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-direct {p0, p1}, Lih0;-><init>(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Lmb0;->k:I

    .line 2
    .line 3
    iget-object p0, p0, Lmb0;->l:Ljava/util/List;

    .line 4
    .line 5
    return-object p0
.end method
