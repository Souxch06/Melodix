.class public final Lb3;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Le3;

.field public final synthetic k:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Le3;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lb3;->j:Le3;

    .line 5
    .line 6
    iput-object p2, p0, Lb3;->k:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lb3;->j:Le3;

    .line 2
    .line 3
    iget-object p0, p0, Lb3;->k:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p0, v0, Le3;->j:Ljava/lang/Object;

    .line 6
    .line 7
    return-void
.end method
