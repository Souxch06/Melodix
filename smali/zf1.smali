.class public final synthetic Lzf1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lfb1;


# instance fields
.field public final synthetic j:Lve;

.field public final synthetic k:Lqf;

.field public final synthetic l:I


# direct methods
.method public synthetic constructor <init>(Lve;Lqf;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lzf1;->j:Lve;

    .line 5
    .line 6
    iput-object p2, p0, Lzf1;->k:Lqf;

    .line 7
    .line 8
    iput p3, p0, Lzf1;->l:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final b()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Lzf1;->j:Lve;

    .line 2
    .line 3
    iget-object v0, v0, Lve;->d:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Lc9;

    .line 6
    .line 7
    iget v1, p0, Lzf1;->l:I

    .line 8
    .line 9
    add-int/lit8 v1, v1, 0x1

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    iget-object p0, p0, Lzf1;->k:Lqf;

    .line 13
    .line 14
    invoke-virtual {v0, p0, v1, v2}, Lc9;->I(Lqf;IZ)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method
