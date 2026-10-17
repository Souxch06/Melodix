.class public final Le72;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field public final j:Ljava/util/zip/Inflater;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/zip/Inflater;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/zip/Inflater;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Le72;->j:Ljava/util/zip/Inflater;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 0

    .line 1
    iget-object p0, p0, Le72;->j:Ljava/util/zip/Inflater;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/zip/Inflater;->end()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
