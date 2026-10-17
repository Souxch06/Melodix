.class public final Llu0;
.super Ldz0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final f:Landroidx/recyclerview/widget/RecyclerView;

.field public final g:Lcz0;

.field public final h:Lku0;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ldz0;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ldz0;->e:Lcz0;

    .line 5
    .line 6
    iput-object v0, p0, Llu0;->g:Lcz0;

    .line 7
    .line 8
    new-instance v0, Lku0;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lku0;-><init>(Llu0;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Llu0;->h:Lku0;

    .line 14
    .line 15
    iput-object p1, p0, Llu0;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final j()Lc1;
    .locals 0

    .line 1
    iget-object p0, p0, Llu0;->h:Lku0;

    .line 2
    .line 3
    return-object p0
.end method
